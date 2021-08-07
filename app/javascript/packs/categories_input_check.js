const categoryTitle = document.getElementById('category-title');
const categoryDescription = document.getElementById('category-description');
const colorTextBox = document.getElementById('color-textbox');
const categoryColorProxy = document.getElementById('category-color-proxy');

const categoryTitleError = document.getElementById('category-title-error');
const categoryDescriptionError = document.getElementById('category-description-error');
// const categoryColorError = document.getElementById('category-color-error');

const submitBtn = document.getElementById('submit-btn');

let check1, check2, check3;

valueCheck = (e) => {
    if (e.target.id == 'category-title') {
        if (e.target.value.length > 0) {
            check1 = true;
            categoryTitleError.classList.add('hidden');
        }
        else categoryTitleError.classList.remove('hidden');
    }
        
    else if (e.target.id == 'category-description') {
        if (e.target.value.length > 0) {
            check2 = true;
            categoryDescriptionError.classList.add('hidden');
        }

        else categoryDescriptionError.classList.remove('hidden');
    }

    if (categoryColorProxy.dataset.colorInput) {
        check3 = true;
        // categoryColorError.classList.add('hidden');
    }
    
    // if all checks passed, remove submit button disable
    if (check1 && check2 && check3) {
        submitBtn.disabled = false;
    }
}

categoryTitle.oninput = valueCheck;
categoryDescription.oninput = valueCheck;
colorTextBox.onchange = valueCheck;
