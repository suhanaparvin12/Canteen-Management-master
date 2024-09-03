


/*show form */
const form = document.getElementById('form-container'),
	  formToggle = document.getElementById('add-btn'),
	  formClose = document.getElementById('form-close');
	  
	  
formToggle.addEventListener('click',()=>{
	form.classList.add('show-form');
})

formClose.addEventListener('click',()=>{
	form.classList.remove('show-form');
})

/*Show edit form */
const editForm = document.getElementById('edit-form-container');
const editButtons = document.querySelectorAll('.edit_btn');
const editFormClose = document.getElementById('edit-form-close');

// Add event listeners to all edit buttons
editButtons.forEach((button) => {
    button.addEventListener('click', () => {
        editForm.classList.add('show-form');
    });
});

// Add event listener to close button
editFormClose.addEventListener('click', () => {
    editForm.classList.remove('show-form');
});


function editItem(element) {
        var itemName = element.getAttribute("data-item");
        var itemPrice = element.getAttribute("data-price");

        // Set the form values with the selected item and price
        document.querySelector("#edit-form-container input[name='item']").value = itemName;
        document.querySelector("#edit-form-container input[name='price']").value = itemPrice;

        // Optionally, you can trigger the display of the edit form
        // Example: document.querySelector("#edit-form-container").style.display = "block";
    }








