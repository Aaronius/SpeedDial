package com.aaronHardy.speedDial.service.contacts
{
	import com.aaronHardy.speedDial.model.AppModel;
	import com.aaronHardy.speedDial.model.vo.Contact;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Actor;
	
	public class ContactsService extends Actor implements IContactsService
	{
		[Inject]
		public var model:AppModel;
		
		public function loadContacts():void
		{
			if (!model.authHeader)
			{
				throw new Error('Must authenticate before loading contacts.');
			}
			
			var url:String = 'http://www.google.com/m8/feeds/contacts/default/full?max-results=1000';
			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.GET;
			request.requestHeaders.push(model.authHeader);
			var loader:URLLoader = new URLLoader();
			//loader.addEventListener( ProgressEvent.PROGRESS, handleLoaderProgress );
			//loader.addEventListener( HTTPStatusEvent.HTTP_STATUS, handleLoaderHTTPStatus );
			//loader.addEventListener( SecurityErrorEvent.SECURITY_ERROR, handleLoaderSecurityError );
			loader.addEventListener( IOErrorEvent.IO_ERROR, handleLoaderIOError );
			loader.addEventListener( Event.COMPLETE, dataHandler );
			loader.load( request );
		}
		
		protected function dataHandler(event:Event):void
		{
			var response:XML = new XML(URLLoader( event.target ).data);
			var contacts:ArrayCollection = parseContacts(response);
			model.contacts = contacts;
		}
		
		protected function handleLoaderIOError(event:IOErrorEvent):void
		{
			trace("ContactsService > IOError", event.text);
		}
		
		protected function parseContacts(response:XML):ArrayCollection
		{
			var ns_atom:Namespace = new Namespace(null, "http://www.w3.org/2005/Atom");
			var ns_gd:Namespace = new Namespace("gd", "http://schemas.google.com/g/2005");
			var contacts:ArrayCollection = new ArrayCollection();
			var entries:XMLList = response.ns_atom::entry;
			var titleQname:QName = new QName(ns_atom, '@title');
			
			for each (var entry:XML in entries)
			{
				var title:String = StringUtil.trim(entry.ns_atom::title);
				var phoneNumber:String = StringUtil.trim(entry.ns_gd::phoneNumber);
				if (title.length > 0 && phoneNumber.length > 0)
				{
					var contact:Contact = new Contact();
					contact.name = title;
					contact.phone = phoneNumber;
					contacts.addItem(contact);
				}
			}
			
			// Sort by name.
			var nameSortField:SortField = new SortField();
			nameSortField.name = 'name';
			
			var nameSort:Sort = new Sort();
			nameSort.fields = [nameSortField];
			
			contacts.sort = nameSort;
			contacts.refresh();
			
			return contacts;
		}
	}
}