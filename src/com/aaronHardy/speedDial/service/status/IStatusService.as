package com.aaronHardy.speedDial.service.status
{
	/**
	 * Watches for StatusMessageEvents and deals with their order and duration and updates
	 * the model's statusMessage property to reflect the most recent, active status.
	 */
	public interface IStatusService
	{
		/**
		 * Starts watching for StatusMessageEvents.
		 */
		function monitorStatus():void
	}
}