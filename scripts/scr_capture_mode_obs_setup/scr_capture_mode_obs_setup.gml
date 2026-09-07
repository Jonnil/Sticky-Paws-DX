/// @function scr_capture_mode_obs_setup_available()
function scr_capture_mode_obs_setup_available()
{
	return global.enable_option_for_pc && scr_capture_mode_obs_platform() != "unsupported";
}

/// @function scr_capture_mode_obs_platform()
/* os_type reports the platform the game was built for. Wine and Proton run the
   Windows build on Linux, so also check the environment they normally expose. */
function scr_capture_mode_obs_platform()
{
	if (os_type == os_linux) return "linux";
	if (os_type == os_macosx) return "macos";
	if (os_type == os_windows)
	{
		if (environment_get_variable("STEAM_COMPAT_DATA_PATH") != ""
			|| environment_get_variable("WINEPREFIX") != "")
		{
			return "linux_compatibility";
		}
		return "windows";
	}
	return "unsupported";
}

/// @function scr_capture_mode_obs_setup_state()
/* Export state survives closing Options or changing rooms while the ZIP is saved. */
function scr_capture_mode_obs_setup_state()
{
	if (!variable_global_exists("capture_mode_obs_setup"))
	{
		global.capture_mode_obs_setup = { busy: false, message: "", path: "" };
	}
	return global.capture_mode_obs_setup;
}

/// @function scr_capture_mode_obs_profile(width, height)
/* Profiles are folders containing basic.ini. OBS supplies this user's recording
   directory and device defaults; never distribute a contributor's personal paths. */
function scr_capture_mode_obs_profile(capture_width, capture_height)
{
	return "[General]\nName=Sticky Paws " + string(capture_height) + "p60\n\n"
		+ "[Output]\nMode=Simple\nFilenameFormatting=Sticky-Paws-%CCYY-%MM-%DD_%hh-%mm-%ss\n\n"
		+ "[SimpleOutput]\nRecFormat2=mkv\nRecQuality=HQ\nRecEncoder=x264\nRecAudioEncoder=aac\nABitrate=320\nRecTracks=1\nRecRB=false\n\n"
		+ "[Video]\nBaseCX=" + string(capture_width) + "\nBaseCY=" + string(capture_height)
		+ "\nOutputCX=" + string(capture_width) + "\nOutputCY=" + string(capture_height)
		+ "\nFPSType=0\nFPSCommon=60\nColorFormat=NV12\nColorSpace=709\nColorRange=Partial\nAutoRemux=true\n\n"
		+ "[Audio]\nSampleRate=48000\nChannelSetup=Stereo\n";
}

/// @function scr_capture_mode_obs_scene(width, height, linux_scene)
/* Windows uses game-capture audio. Linux requires the recipient's own screen
   sharing selection and game-only audio routing. Global audio is omitted so
   importing this collection does not enable desktop or microphone sources. */
function scr_capture_mode_obs_scene(capture_width, capture_height, linux_scene)
{
	var source_name = linux_scene ? "Select the Sticky Paws window" : "Sticky Paws Game Capture";
	var source_type = linux_scene ? "pipewire-screen-capture-source" : "game_capture";
	var source_settings = linux_scene
		? { ShowCursor: false }
		: {
			capture_mode: "window",
			window: "Sticky Paws:YYGameMakerYY:Sticky Paws.exe",
			priority: 2,
			capture_cursor: false,
			capture_overlays: false,
			capture_audio: true
		};
	var capture_source = {
		name: source_name,
		id: source_type,
		versioned_id: source_type,
		settings: source_settings,
		mixers: linux_scene ? 0 : 1,
		volume: 1.0,
		muted: false,
		sync: 0,
		monitoring_type: 0,
		hotkeys: {}
	};
	var scene_source = {
		name: "Sticky Paws Gameplay",
		id: "scene",
		versioned_id: "scene",
		settings: {
			custom_size: false,
			id_counter: 1,
			items: [{
				name: source_name,
				id: 1,
				visible: true,
				locked: false,
				rot: 0.0,
				pos: { x: 0.0, y: 0.0 },
				scale: { x: 1.0, y: 1.0 },
				align: 5,
				bounds_type: 2,
				bounds_align: 0,
				bounds: { x: capture_width, y: capture_height },
				crop_left: 0,
				crop_top: 0,
				crop_right: 0,
				crop_bottom: 0
			}]
		},
		mixers: 1,
		volume: 1.0,
		muted: false
	};
	return json_stringify({
		name: "Sticky Paws " + string(capture_height) + "p60 - " + (linux_scene ? "Linux" : "Windows"),
		current_scene: scene_source.name,
		current_program_scene: scene_source.name,
		scene_order: [{ name: scene_source.name }],
		sources: [capture_source, scene_source],
		groups: [],
		quick_transitions: [],
		transitions: []
	});
}

/// @function scr_capture_mode_obs_instructions(width, height)
function scr_capture_mode_obs_instructions(capture_width, capture_height)
{
	var obs_platform = scr_capture_mode_obs_platform();
	var scene_collection_step = obs_platform == "macos"
		? "3. This package does not include a tested macOS Scene Collection. Follow the macOS instructions below to create one.\n"
		: "3. In OBS, select Scene Collection > Import. Select Scene Collection.json, then select the imported Sticky Paws collection.\n";
	var import_heading = obs_platform == "macos" ? "IMPORT THE PROFILE\n" : "IMPORT BOTH PARTS\n";
	var platform_instructions = "";
	if (obs_platform == "windows")
	{
		platform_instructions = "WINDOWS SETUP\n"
			+ "Use the latest stable version of OBS Studio. This setup uses the Capture Audio option built into the Game Capture source so that only Sticky Paws audio is recorded. If Capture Audio is missing, update OBS Studio. Open the source properties and select the running Sticky Paws window if the preview is black. The target matches Sticky Paws.exe instead of the changing window title. Do not substitute Display Capture.\n\n";
	}
	else
	if (obs_platform == "linux" || obs_platform == "linux_compatibility")
	{
		platform_instructions = "LINUX SETUP\n"
			+ (obs_platform == "linux_compatibility"
				? "Sticky Paws detected that its Windows build is running through a Linux compatibility tool. The included Scene Collection is therefore made for the Linux version of OBS Studio.\n"
				: "")
			+ "Use the latest stable version of OBS Studio. When Linux asks which window or screen to share, select only Sticky Paws. OBS may call this source Screen Capture (PipeWire). PipeWire is the Linux system used to share audio and video between applications. No personal sharing permission is stored in this package. Game audio is not configured automatically. Add and route a source containing only Sticky Paws audio to recording track 1. Do not enable general Desktop Audio or a microphone. This scene still requires testing on Linux.\n\n";
	}
	else
	if (obs_platform == "macos")
	{
		platform_instructions = "MACOS SETUP\n"
			+ "Use the latest stable version of OBS Studio that supports your version of macOS. The Profile can be imported, but this package does not include a tested macOS Scene Collection. Create an Application Capture or Window Capture source for Sticky Paws, grant the permissions requested by macOS, and route only the game's audio. This setup still requires testing on macOS.\n\n";
	}

	return "STICKY PAWS - OBS RECORDING SETUP\n"
		+ string(capture_width) + " x " + string(capture_height) + ", 60 FPS, stereo 48 kHz\n\n"
		+ "USE THE LATEST STABLE OBS STUDIO\n"
		+ "Install or update OBS Studio from https://obsproject.com/. Using the latest stable release keeps the imported setup compatible without depending on a version number that will become outdated.\n\n"
		+ import_heading
		+ "1. Extract this ZIP.\n"
		+ "2. In OBS, select Profile > Import. Select the Profile folder containing basic.ini, then select Sticky Paws " + string(capture_height) + "p60 in the Profile menu. An OBS Profile is a folder containing basic.ini. It is not a JSON file.\n"
		+ scene_collection_step
		+ "4. In Settings > Output, choose your recording folder. In Settings > Video, confirm the resolution above and 60 FPS. Enable the matching Capture Mode preset in the game and wait until it is applied. Saving this package does not change the game's settings.\n\n"
		+ platform_instructions
		+ "TEN-SECOND TEST BEFORE RECORDING TAKES\n"
		+ "Record movement and a gameplay sound, stop, and play back the MP4. Check that the game fills the frame, movement is smooth at 60 FPS, and the cursor, overlays, desktop, microphone, music and jingles are absent. Verify gameplay effects are audible. While testing, play another application's sound and confirm it does not appear in the recording. If there are black borders, fix the game/source size instead of stretching the picture.\n"
		+ "These are starting configurations, not a guarantee of compatibility with every computer. If OBS reports encoding overload, use a supported hardware H.264 recording encoder at comparable quality and repeat the test. Do not lower the requested resolution or frame rate.\n\n"
		+ "SHORT MP4 TAKES FOR EDITORS\n"
		+ "Start and stop recording for each useful action, leaving a few seconds before and after it. This makes separate small clips. Automatic splitting is not enabled. OBS records MKV for recovery and automatically remuxes each finished take to MP4. If no MP4 appears, use File > Remux Recordings. Keep the original MKVs until the MP4s have been checked.\n"
		+ "Name each MP4 with the level, action and take number. Give the editor the useful MP4s plus any brief notes. Check every clip has picture and gameplay sound. An existing long recording is still useful if accompanied by timestamps.\n\n"
		+ "YOUR EXISTING SETUP\n"
		+ "Import under these separate Sticky Paws names. Do not replace your usual profile or collection. This package contains no stream keys, recording paths, microphones or desktop-audio sources. Return to your usual Profile and Scene Collection when finished. Turn off Capture Mode to restore game settings. It also turns off when the game closes.\n";
}

/// @function scr_capture_mode_obs_export(width, height)
function scr_capture_mode_obs_export(capture_width, capture_height)
{
	var export_state = scr_capture_mode_obs_setup_state();
	if (export_state.busy || !scr_capture_mode_obs_setup_available()) return;
	if (!((capture_width == 1280 && capture_height == 720)
		|| (capture_width == 1920 && capture_height == 1080))) return;

	export_state.message = "";
	var export_worker = instance_create_depth(0, 0, 0, obj_capture_mode_obs_export);
	try
	{
		var export_root = game_save_id + "capture_mode_obs/";
		if (!directory_exists(export_root)) directory_create(export_root);
		var export_name = "Sticky-Paws-OBS-" + string(capture_height) + "p60";
		var export_number = 1;
		while (file_exists(export_root + export_name + "-" + string(export_number) + ".zip")
			|| directory_exists(export_root + export_name + "-" + string(export_number)))
		{
			export_number++;
		}
		export_worker.export_path = export_root + export_name + "-" + string(export_number) + ".zip";
		export_worker.staging_path = export_root + export_name + "-" + string(export_number) + "/";
		directory_create(export_worker.staging_path);
		var obs_platform = scr_capture_mode_obs_platform();
		var export_entries = [
			{ name: "Profile/basic.ini", content: scr_capture_mode_obs_profile(capture_width, capture_height) },
			{ name: "READ ME FIRST.txt", content: scr_capture_mode_obs_instructions(capture_width, capture_height) }
		];
		if (obs_platform == "windows")
		{
			array_push(export_entries, { name: "Scene Collection.json", content: scr_capture_mode_obs_scene(capture_width, capture_height, false) });
		}
		else
		if (obs_platform == "linux" || obs_platform == "linux_compatibility")
		{
			array_push(export_entries, { name: "Scene Collection.json", content: scr_capture_mode_obs_scene(capture_width, capture_height, true) });
		}
		export_worker.zip_file = zip_create();
		for (var entry_index = 0; entry_index < array_length(export_entries); entry_index++)
		{
			var entry_path = export_worker.staging_path + string(entry_index) + ".txt";
			var entry_file = file_text_open_write(entry_path);
			if (entry_file < 0) throw "Cannot write OBS setup file";
			array_push(export_worker.staging_files, entry_path);
			file_text_write_string(entry_file, export_entries[entry_index].content);
			file_text_close(entry_file);
			zip_add_file(export_worker.zip_file, export_entries[entry_index].name, entry_path);
		}
		export_state.busy = true;
		export_state.message = l10n_text("Saving OBS setup...");
		export_worker.request_id = zip_save(export_worker.zip_file, export_worker.export_path);
	}
	catch (export_error)
	{
		export_state.busy = false;
		export_state.message = l10n_text("Could not save the OBS setup. Check free disk space and try again.");
		with (export_worker) instance_destroy();
	}
}
