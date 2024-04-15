/* This function takes an array of sound variations and returns one randomly chosen variation */
function scr_choose_sound_variation(variations) 
{
    /* Create an empty array to store valid variations */
    var valid_variations = [];
    
    /* Loop through each element in the variations array */
    for(var i = 0; i < array_length(variations); i++) 
    {
        /* Check if the variation at index i is not equal to "noone" (indicating it exists) */
        if (variations[i] > noone) 
        {
            /* If the variation exists, add it to the list of valid variations */
            array_push(valid_variations, variations[i]);
        }
    }
    
    /* Check if there are any valid variations in the list */
    if (array_length(valid_variations) > 0)
    {
        /* If there are valid variations, select a random index within the valid variations array */
        var random_index = irandom(array_length(valid_variations) - 1);
        /* Retrieve the chosen sound variation based on the random index */
        var sound_variable_that_will_choose = valid_variations[random_index];
    }
    else
    {
        /* If there are no valid variations, assign "noone" to the chosen sound variable */
        sound_variable_that_will_choose = noone;
    }
    
    /* Return the chosen sound variation */
    return sound_variable_that_will_choose;
}