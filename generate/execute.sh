#!/bin/bash


# Define the options for the dropdown menu
options=("Component" "Page" "Service" "Provider")

# Display the menu
PS3="Choose what to generate:"
select choice in "${options[@]}"
do
    case $REPLY in
        1)
            echo ""
            echo "🔥 You choosed option: Component"
            echo ""
            
            # Execute command
            bash generate/component.sh

            exit
            ;;
        2)
            echo ""
            echo "🔥 You choosed option: Page"
            echo ""
            
            # Execute command
            bash generate/page.sh

            exit
            ;;
        3)
            echo ""
            echo "🔥 You choosed option: Service"
            echo ""
            
            # Execute command
            bash generate/service.sh

            exit
            ;;
        4)
            echo ""
            echo "🔥 You choosed option: Provider"
            echo ""
            
            # Execute command
            bash generate/provider.sh

            exit
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
done
