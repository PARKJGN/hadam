document.addEventListener('DOMContentLoaded', function() {    
	
	
    $('#courseContainer').on('click', '.highlightable', function () {
        // Toggle the 'highlight' class on the clicked label
        $(this).toggleClass('highlight');
    });
	// Handle the click event for the "+" button
    $('#courseContainer').on('click', '.quantity-up', function () {
        // Clone the last course div set
        var newCourseDiv = $('#courseContainer .quantity-item:last').clone();

        // Clear input value in the cloned div
        newCourseDiv.find('input').val('');

        // Append the cloned div to the container
        $('#courseContainer').append(newCourseDiv);
    });
    
        // Handle the click event for the "-" button
    $('#courseContainer').on('click', '.quantity-down', function () {
        // Check if there's more than one course div set before removing
        if ($('#courseContainer .quantity-item').length > 1) {
            // Remove the last course div set
            $('#courseContainer .quantity-item:last').remove();
        }
    });
});