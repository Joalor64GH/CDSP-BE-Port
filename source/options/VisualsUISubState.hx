package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class VisualsUISubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Visuals and UI';
		rpcTitle = 'Tweaking the Visuals and UI'; // for Discord Rich Presence

		var option:Option = new Option('Auto Pause',
			'If checked, pauses the game when unfocused.',
			'autoPause',
			'bool',
			true);
		option.onChange = onChangeAutoPause;
		addOption(option);

		var option:Option = new Option('Note Splashes', "If unchecked, hitting \"Sick!\" notes won't show particles.", 'noteSplashes', 'bool', true);
		addOption(option);

		var option:Option = new Option('Hide HUD', 'If checked, hides most HUD elements.', 'hideHud', 'bool', false);
		addOption(option);

		var option:Option = new Option('Time Bar:', "What should the Time Bar display?", 'timeBarType', 'string', 'Time Left',
			['Time Left', 'Time Elapsed', 'Song Name', 'Disabled']);
		addOption(option);

		var option:Option = new Option('Time Bar Style:', "What should the Time Bar look like?", 'timeBarUi', 'string', 'Psych Engine',
			['Psych Engine', 'Kade Engine']);
		addOption(option);

		var option:Option = new Option('Flashing Lights', "Uncheck this if you're sensitive to flashing lights!", 'flashing', 'bool', true);
		addOption(option);

		var option:Option = new Option('Camera Zooms', "If unchecked, the camera won't zoom in on a beat hit.", 'camZooms', 'bool', true);
		addOption(option);

		var option:Option = new Option('Score Text Zoom on Hit', "If unchecked, disables the Score text zooming\neverytime you hit a note.", 'scoreZoom',
			'bool', true);
		addOption(option);

		var option:Option = new Option('Health Bar Opacity', 'How much Opaque should the health bar and icons be.', 'healthBarAlpha', 'percent', 1);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Background Opacity', 'How much Opaque should  the Background be.', 'backgroundalpha', 'percent', 1);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Judgement Skin:', "What should your judgements look like?", 'uiSkin', 'string', 'Bedrock',
			['Classic', 'BEAT!', 'BEAT! Gradient', 'Bedrock']);
		addOption(option);

		var option:Option = new Option('Show Watermarks', "If unchecked, hides engine watermarks from the bottom left corner.", 'showWatermarks', 'bool', true);
		addOption(option);

		var option:Option = new Option('Show Song Name', "If unchecked, hides the Song Name from the bottom left corner.", 'showSongName', 'bool', true);
		addOption(option);
		
		var option:Option = new Option('Show Judgement Counter', "If checked, will show Judgement Counters at the left side of the screen.", 'judgCounter', 'bool', true);
		addOption(option);

		#if !mobile
		var option:Option = new Option('FPS Counter', 'If unchecked, hides FPS Counter.', 'showFPS', 'bool', true);
		addOption(option);
		option.onChange = onChangeFPSCounter;
		#end

		super();
	}

	function onChangeAutoPause()
	{
		FlxG.autoPause = ClientPrefs.autoPause;
	}

	#if !mobile
	function onChangeFPSCounter()
	{
		if (Main.fpsVar != null)
			Main.fpsVar.visible = ClientPrefs.showFPS;
	}
	#end
}
