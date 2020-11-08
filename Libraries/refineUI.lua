--// refineUI
local refineUI = {}

-- refineUI.import(tab: string, container: string, elements: table)
function refineUI.import(tab, container, elements)
    -- Define a table that we will return later
    local elements_out = {}

    -- Loop through all element names
    for index, value in next, elements do
        -- Create a new element object
        local element = { name = value, options = table.pack(ui.reference(tab, container, value)) }

        -- Change the spaces [ ] to underscores in the value name [_]
        value = value:gsub(' ', '_')

        -- Insert the element object into elements_out with the expected name
        elements_out[ value ] = element
    end

    -- Return the elements_out object
    return elements_out
end

-- refineUI.set_visible(elements: table)
function refineUI.set_visible(elements, state)
    -- Loop through all elements objects
    for index, value in next, elements do
        -- Loop through all actual elements
        for index, value in next, value.options do
            -- Set the visibility
            ui.set_visible(value, state)
        end
    end
end

--// Return the library for later use
return refineUI
