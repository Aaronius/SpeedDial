package com.aaronHardy.speedDial.service.phoneCredentials
{
	/**
	 * Deals with credentials for the user's phone.
	 */
	public interface IPhoneCredentialsService
	{
		/**
		 * Saves credentials to local storage.
		 */
		function saveCredentials(extension:String, pin:String):Boolean;
		
		/**
		 * Loads credentials from local storage.
		 */
		function loadCredentials():Boolean;
	}
}