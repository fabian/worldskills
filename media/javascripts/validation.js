
// This file is used to check for valid email address

function validate(event) {
	var email = document.getElementById('email').value;
	
	// Check for @
	if (email.indexOf('@') == -1) {
		
		// @ no here, alert and focus field
		alert('Please enter a valid email address!');
		document.getElementById('email').focus();
		
		// cancel submit
		if (event.preventDefault) {
			event.preventDefault();
		}
		return false;
	}
	
	// everything okay
	return true;
}
