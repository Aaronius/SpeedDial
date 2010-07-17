package com.aaronHardy.speedDial.service.contactsCredentials
{
	public interface IContactsCredentialsService
	{
		function saveCredentials(username:String, password:String):Boolean;
		function loadCredentials():Boolean;
	}
}