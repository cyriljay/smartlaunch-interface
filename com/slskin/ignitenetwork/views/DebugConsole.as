﻿/*
Ruben Oanta
SL Interface

Definition for the debug console. This definition
represents the DebugConsole movieclip found in the library.
*/
package com.slskin.ignitenetwork.views
{
	import flash.external.ExternalInterface;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.InteractiveObject;
	import flash.utils.setTimeout;
	import flash.events.MouseEvent;
	import com.slskin.ignitenetwork.events.SLEvent;
	import com.slskin.ignitenetwork.Main;
	
	public class DebugConsole extends MovieClip
	{
		private var _debug:Boolean;
		private var main:Main;
		
		public function DebugConsole(debug:Boolean = true)
		{
			this.debug = debug;
			this.write("Debug Mode Enabled. You can toggle this console with the ` key.");
			this.tabChildren = false;
			//add listener for added to stage
			this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
		}
		
		/* Setters and Getters */
		public function set debug(d:Boolean):void { this._debug = d; }
		public function get debug():Boolean { return this._debug; }
		
		/*
		onInjectClick
		Adds the a series of commands to the data shared between
		SL and the client interface.
		*/
		private function onInjectClick(evt:MouseEvent):void
		{
			this.write("Injecting the following Data: ");
			main.model.addProperty(main.model.DATA_PATH + "RequiredInformationAtLogin", "0");
			main.model.addProperty(main.model.DATA_PATH + "Firstname", "Ruben");
			main.model.addProperty(main.model.DATA_PATH + "Username", "rubeydoo");
			main.model.addProperty(main.model.DATA_PATH + "Balance", "-30.50");
			main.model.addProperty(main.model.DATA_PATH + "Time", "-375");
			main.model.addProperty(main.model.TEXT_PATH + "Welcome_Message", "Welcome back Ruben<br><font color='#0080FF' size='+1'>Time used:</font> 6 hour and 30 minutes<br><font color='#0080FF' size='+1'>Last Visit:</font> 2/8/2012 2:24:27 pm");
			main.model.addProperty(main.model.TEXT_PATH + "Headline1", "ignite network gaming lounge");
			main.model.addProperty(main.model.TEXT_PATH + "Headline2", "2/09/2012 - PC 48");
			main.model.addProperty(main.model.TEXT_PATH + "Logout_UpperCase", "LOGOUT");
			main.model.dispatcher(SLEvent.UPDATE_CATEGORY_LIST, "Games;1;0;Games|Most Played FPS;23;15;Most Played FPS|Strategy;32;14;Strategy|mmorpgs;22;3;mmorpgs|FPS;35;8;FPS|Classics;16;17;Classics|^Programs;17;0;Programs|Chat;33;6;Chat|Office;20;1;Office|Pictures;36;3;Pictures|Media;34;1;Media|Other;21;4;Other|^Internet;3;1;Internet|^Options;-2;4;Options|");
			main.model.dispatcher(SLEvent.UPDATE_FAVORITES, "Counter-Strike|101^World Of Warcraft|300^League of Legends|202^Warcraft III|98");
			main.model.addProperty(main.model.DATA_PATH + "Sex", "1");
			main.model.addProperty(main.model.APP_DATA_PATH + "Application_Status", '<FONT COLOR="#FFFFFF"><B>Players:</B></FONT><BR><FONT COLOR="#B5B5A4">7 users are currently playing this game.</FONT><BR><BR><FONT COLOR="#FFFFFF"><B>Game type:</B></FONT><BR><FONT COLOR="#B5B5A4">Singleplayer, Multiplayer</FONT>');
			main.model.addProperty(main.model.APP_DATA_PATH + "Application_Headline", "Starcraft II");
			main.model.addProperty(main.model.APP_DATA_PATH + "Application_Type", "Game");
			main.model.addProperty(main.model.APP_DATA_PATH + "Application_Description", "The original StarCraft made its debut in 1998, and it quickly became one of the most popular real-time strategy games of all time.We've waited a long time for an updated sequel, and rumors of it were periodically dangled in front of us like a space carrot over the years. So why did it take so long? Because that is precisely how long it took to fill it with the perfect amount of awesome. It's a continuation of the epic struggle between the human Terrans, the insect-like Zerg and the psionic Protoss. Fans of the original will see some familiar faces, as well as a cast of new heroes as they do battle across the galaxy with veteran, upgraded and brand new unit types. To remain consistent with the game's new-millennium feel, the Battle.net gaming service has been completely revamped to offer noticeable enhancements and new features in multiplayer mode. The fun of StarCraft II is not limited to those who played the first StarCraft, however. Even if you were a toddler when the first game came out, you'll be able to choose your faction and jump right into the fray.");
			main.model.addProperty(main.model.DATA_PATH + "RequiredUserInformation", "11111100101100000");
			main.model.addProperty(main.model.DATA_PATH + "PersonalInfoArray", "Firstname|Lastname|Birthday|Address|City|Zip|State|Country|Email|Telephone|Mobilephone|Sex|PersonalNumber");
			main.model.dispatcher(SLEvent.UPDATE_NEWS_EVENTS, "1/28/2012|Join us on facebook.|You can now follow us on facebook. Connect with others who come to ignite and keep up with new games, events, and promotions at facebook.com/ignitenetwork.|http://facebook.com/ignitenetwork^7/23/2008|Cafe Now Open!|Our cafe is now open! We have freshly brewed coffee or you can try any of our delicious smoothies, blended ice coffees, or lattes. Take a look at our menu for a more elaborate list of drinks.|^6/26/2008|Consoles at ignite|After much anticipation, ignite has finally entered the console gaming domain. We’re excited to be able to offer many additional game titles that are exclusive to consoles. Check out some of the titles we have for the Sony Playstation 3, Nintendo Wii, and Xbox 360. |^6/26/2008|Repair or Upgrade Your Computer Here!|Repair or upgrade your computer here at ignite and experience no downtime! You will be given the opportunity to use ignite network's computers free of charge! For a more thorough description of our PC repair department please visit our website or ask an ignite staff member.|^6/26/2008|Refer a Friend: Get 2 Free Hours!|Bring a new friend along and we'll add 2 HOURS to your account!  Your friend is simply required to create an account and purchase time on his/her first visit to qualify.|^");
			
			main.model.dispatcher(SLEvent.LOGIN_COMPLETED, "Complete");
			//ErrorView.getInstance().showError("This is the error window. It is displayed when there is an error or exception :)");
		} 
		
		/*
		onAdded
		Listens for the added to stage event. Sets up the objects
		on the stage properly.
		*/
		private function onAdded(evt:Event):void
		{
			//remove listener
			this.removeEventListener(Event.ADDED_TO_STAGE, this.onAdded);
			
			//set reference to main
			main = (root as Main);
			
			//sim stage resize
			this.onStageResize(null);
			
			//listen for stage resize
			this.stage.addEventListener(Event.RESIZE, this.onStageResize);
			
			//listen for key press
			stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPress);
			
			//setup inject button
			this.injectButton.label = "Inject";
			this.injectButton.button.addEventListener(MouseEvent.CLICK, onInjectClick);
		}
		
		/*
		show
		Setup the debug console properties and location on
		the stage.
		*/
		public function showView():void
		{
			this.x = 0;
			this.y = stage.stageHeight - this.debugOut.height - 50;
		}
		
		/*
		hide
		Removes it's self from stage.
		*/
		public function hideView():void
		{
			(parent as MovieClip).removeChild(this);
		}
		
		
		/*
		onKeyPress
		Listen for keypress and if key is backquote, show/hide debug console
		*/
		private function onKeyPress(keyEvent:KeyboardEvent):void
		{
			if(keyEvent.keyCode == Keyboard.BACKQUOTE)
				this.toggleConsole();
		}
		
		/*
		toggleConsole
		Toggles the debug console on/off.
		*/
		private function toggleConsole():void
		{
			if(this.visible)
				this.visible = false;
			else
				this.visible = true;
		}
		
		/*
		onStageResize
		Listens for stage resize event
		*/
		private function onStageResize(evt:Event):void {
			this.showView();
		}
		
		/*
		write
		Writes a line to the debug console.
		*/
		public function write(line:String):void
		{
			//don't waste any cpu writing to console if
			//we debug mode is off.
			if(this.debug)
			{
				this.debugOut.appendText("==> " + line + "\n");
				//update scroll bar position.
				setTimeout(function():void{debugOut.verticalScrollPosition = debugOut.maxVerticalScrollPosition;}, 100);
			}
		}
		
		
		
	} //class
} //package