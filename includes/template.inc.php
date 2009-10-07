<?php

/**
 * Helper class for simple XML handling. Extends
 * SimpleXMLElement and adds functionality.
 *
 * @author sk17user12
 * @see SimpleXMLElement
 */
class XML extends SimpleXMLElement {

	/**
	 * Method to add any type of value to the XML.
	 * Arrays get transformed into XML syntax.
	 * 
	 * @param $title final node name
	 * @param mixed $value value to add
	 * @param XML $node if <code>null</code>, $this will be used as parent node
	 * @return SimpleXMLElement the added node
	 */
	public function add($title, $value, XML $node = null) {
		if ($node == null) {
			$node = $this; // use this if no node is provided
		}

		// check for array
		if (is_array($value)) {
			
			// add parent node
			$parent = $node->addChild($title);
			
			// loop value array
			foreach ($value as $key => $value) {
				if (is_numeric($key)) {
					$key = 'object'; // numberic node names are not valid, so use <object>
				}
				$this->add($key, $value, $parent); // recursive call
			}
		} else {
			// no array, just add it
			$parent = $node->addChild($title, htmlentities($value));
		}

		// return parent node
		return $parent;
	}

	/**
	 * Add language text from XML file to XML (merge two SimpleXMLElement).
	 * 
	 * @param SimpleXMLElement $xml language file
	 * @param $node Actual node to append to.
	 */
	public function lang(SimpleXMLElement $xml, $node) {
		foreach ($xml as $key => $value) {
			$node->$key = $value;
		}
	}

	/**
	 * Copy SimpleXMLElement into lang.
	 * 
	 * @param $xml language text
	 * @param $node parent node
	 */
	public function sublang(SimpleXMLElement $xml, $node) {
		foreach ($xml as $key => $value) {
			$parent = $node->addChild($key, (string) $value); // add child
			foreach ($value->attributes() as $name => $val) {
				$parent[$name] = $val; // copy attributes
			}
			$this->sublang($value, $parent); // recursive call
		}
	}
}

class Template {

	protected $xsl;

	public function __construct($template) {

		$dom = DOMDocument::load(dirname(__FILE__) . '/../templates/' . $template);

		$this->xsl = new XSLTProcessor();
		$this->xsl->importStyleSheet($dom);

	}

	public function display(XML $xml) {
		$dom_sxe = dom_import_simplexml($xml);

		$dom = new DOMDocument('1.0');
		$dom_sxe = $dom->importNode($dom_sxe, true);
		$dom_sxe = $dom->appendChild($dom_sxe);

		echo $this->xsl->transformToXML($dom);
	}
}
