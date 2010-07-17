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

package net.nobien.webapis.google.accounts
{
	import flash.events.EventDispatcher;
	import flash.net.URLRequestHeader;
	import net.nobien.webapis.google.accounts.ClientLogin;
	
	/**
	 * Dispatched when data is received as the download operation progresses.
	 * @eventType flash.events.ProgressEvent.PROGRESS
	 */
	[Event(name="progress", type="flash.events.ProgressEvent")]
	
	/**
	 * Dispatched when a network request returns an HTTP status code.
	 * @eventType flash.events.IOErrorEvent.IO_ERROR
	 */
    [Event(name="httpStatus", type="flash.events.HTTPStatusEvent")]
    
    /**
	 * Dispatched if a call to the server results in a fatal error that 
	 * terminates the download.
	 * @eventType flash.events.IOErrorEvent.IO_ERROR
	 */
    [Event(name="ioError", type="flash.events.IOErrorEvent")]
    
    /**
	 * Dispatched when a call attempts to load data from a server outside 
	 * the security sandbox.
	 * @eventType flash.events.SecurityErrorEvent.SECURITY_ERROR
	 */
    [Event(name="securityError", type="flash.events.SecurityErrorEvent")]
    
    /**
	 * Dispatched when a successful login attempt occurs and auth token
	 * is received from Google after a <code>clientLogin.authenticate()</code> method is called.
	 * @eventType net.nobien.webapis.google.events.AccountsEvent.AUTH_GET_TOKEN
	 */
    [Event(name="authGetToken", type="net.nobien.webapis.google.events.AccountsEvent")]
    
    /**
	 * Dispatched when a login attempt fails after a <code>clientLogin.authenticate()</code> method is called..
	 * @eventType net.nobien.webapis.google.events.AccountsEvent.AUTH_FAILURE
	 */
	[Event(name="authFailure", type="net.nobien.webapis.google.events.AccountsEvent")]
    
    /**
	 * The AccountsService class abstracts the Google accounts
	 * authentication protocol. More information can be found
	 * at http://code.google.com/apis/gdata/auth.html
	 */
	public class AccountsService extends EventDispatcher
	{
		private var _authToken:String;
    	private var _authHeader:URLRequestHeader;
		private var _clientLogin:ClientLogin;
		
		/**
		 * Constructs a new AccountsService object.
		 */
		public function AccountsService() 
		{
			_clientLogin = new ClientLogin( this );
		}
		
		/**
		 * The auth token received from Google upon authentication.
		 */
		public function get authToken():String
		{
			return _authToken;
		}
		
		public function set authToken( v:String ):void
		{
			_authToken = v;
		}
		
		/**
		 * The URLRequestHeader needed for subsequent Google API calls.
		 */
		public function get authHeader():URLRequestHeader
		{
		    return _authHeader;
		}
		
		public function set authHeader( v:URLRequestHeader ):void
		{
		    _authHeader = v;
		}
		
		/**
		 * The ClientLogin method group.
		 */
		public function get clientLogin():ClientLogin
		{
			return _clientLogin;
		}
		
	}
	
}
