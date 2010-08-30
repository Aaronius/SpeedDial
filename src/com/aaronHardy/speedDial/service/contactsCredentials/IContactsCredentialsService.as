package com.aaronHardy.speedDial.service.contactsCredentials
{
	/**
	 * Deals with credentials for loading contacts.
	 */
	public interface IContactsCredentialsService
	{
		/**
		 * Saves credentials to local storage.
		 */
		function saveCredentials(username:String, password:String):Boolean;
		
		/**
		 * Loads credentials from local storage.
		 */
		function loadCredentials():Boolean;
	}
}