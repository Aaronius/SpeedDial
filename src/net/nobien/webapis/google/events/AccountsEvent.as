/*
Source Code License Agreement
Copyright (c) 2007, Matthew D. Wright. All rights reserved.

Matthew D. Wright grants to you a perpetual, worldwide, non-exclusive,
no-charge, royalty-free, irrevocable copyright license, to reproduce,
prepare derivative works of, publicly display, publicly perform, and
distribute this source code and such derivative works in source or
object code form without any attribution requirements.

The name "Matthew D. Wright" must not be used to endorse or promote 
products derived from the source code without prior written permission.

You agree to indemnify, hold harmless and defend Matthew D. Wright from 
and against any loss, damage, claims or lawsuits, including attorney's fees 
that arise or result from your use or distribution of the source code.

THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT
ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE ARE DISCLAIMED. ALSO, THERE IS NO WARRANTY OF
NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT. IN NO EVENT SHALL MACROMEDIA
OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package net.nobien.webapis.google.events 
{

	import flash.events.Event;
	
	/**
	 * Event class that contains information about events broadcast in 
	 * response to the Google Accounts API.
	 */
	public class AccountsEvent extends Event
	{
		/**
		 * Constant for authGetToken event.
		 */
		public static const AUTH_GET_TOKEN:String = "authGetToken";
		
		/**
		 * Constant for authFailure event.
		 */
		public static const AUTH_FAILURE:String = "authFailure";
		
		private var _data:Object = new Object();
		
		/**
		 * Constructs a new AccountsEvent object.
		 */
		public function AccountsEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) 
		{
			super( type, bubbles, cancelable );
		}
		
		/**
		 * The abstracted response data. Either a AuthResult object or 
		 * AuthError object.
		 */
		public function get data():Object
		{
			return _data;
		}
		
		public function set data( v:Object ):void
		{
			_data = v;
		}
		
	}
	
}
