/// @function check_fps_bug_report(simulated_fps)
/// @description Monitors FPS and accumulates the duration that FPS remains below an acceptable threshold. When FPS recovers, if the low-FPS period was significant, a report is output.
/// @param simulated_fps Optional: Use this value as the current FPS for testing; defaults to fps_real.
function check_fps_bug_report(simulated_fps = fps_real)
{
    // Configurable parameters (all local)
    var acceptable_fps_threshold = 50;       // FPS value below which performance is considered low.
    var low_fps_trigger_duration = 0.25;       // Minimum continuous low-FPS time (in seconds) to consider it an event.
    
    // Use the provided simulated FPS (or default to fps_real)
    var current_fps = simulated_fps;
    
    // Calculate the time elapsed in the current step.
    var dt = 1 / room_speed;
    
    // Static variables to persist between function calls:
    // accumulated_low_fps_duration: total time (in seconds) the game has been in low-FPS mode.
    // low_fps_active: flag indicating whether a low-FPS event is currently active.
    // lowest_detected_fps: the lowest FPS encountered during the current low-FPS event.
    static accumulated_low_fps_duration = 0;
    static low_fps_active = false;
    static lowest_detected_fps = 9999; // Initialize with a high value
    
    if (current_fps < acceptable_fps_threshold) {
        // We're in a low-FPS state: accumulate time.
        accumulated_low_fps_duration += dt;
        
        if (!low_fps_active) {
            // Start a new low-FPS event.
            low_fps_active = true;
            lowest_detected_fps = current_fps;
        } else {
            // Update the lowest detected FPS if this frame is lower.
            if (current_fps < lowest_detected_fps)
                lowest_detected_fps = current_fps;
        }
    } else {
        // FPS has recovered. If we were previously in a low-FPS event...
        if (low_fps_active) {
            // Only output a report if the event lasted at least the trigger duration.
            if (accumulated_low_fps_duration >= low_fps_trigger_duration) {
                var report = "";
                report += "=== Low FPS Event Ended ===\n";
                report += "Low FPS lasted for: " + string(accumulated_low_fps_duration) + " seconds\n";
                report += "Lowest FPS detected: " + string(lowest_detected_fps) + "\n";
                report += "Recovery FPS: " + string(current_fps) + "\n";
                show_debug_message(report);
            }
            // Reset state once the event ends.
            accumulated_low_fps_duration = 0;
            low_fps_active = false;
            lowest_detected_fps = 9999;
        }
    }
}
