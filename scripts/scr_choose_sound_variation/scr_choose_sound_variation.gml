function scr_choose_sound_variation(variations) 
{
    var valid_variations = [];
    
    for (var i = 0; i < array_length_1d(variations); i++) 
    {
        if (variations[i] > noone) 
        {
            array_push(valid_variations, variations[i]);
        }
    }
    
    if (array_length_1d(valid_variations) > 0)
    {
        var random_index = irandom(array_length_1d(valid_variations) - 1);
        var sound_variable_that_will_choose = valid_variations[random_index];
    }
    else
    {
        sound_variable_that_will_choose = noone;
    }
    
    return sound_variable_that_will_choose;
}