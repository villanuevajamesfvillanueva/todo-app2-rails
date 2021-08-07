const taskTitle = document.getElementById('task-title');
const taskCategory = document.getElementById('task-category');
const taskDeadline = document.getElementById('task-deadline');
const taskBody = document.getElementById('task-body');

const taskTitleError = document.getElementById('task-title-error');
const taskCategoryError = document.getElementById('task-category-error');
const taskDeadlineError = document.getElementById('task-deadline-error');
const taskBodyError = document.getElementById('task-body-error');

const submitBtn = document.getElementById('submit-btn');

let check1, check2, check3, check4;

valueCheck = (e) => {
    if (e.target.id == 'task-title') {
        if (e.target.value.length > 0) {
            check1 = true;
            taskTitleError.classList.add('hidden');
        }

        else taskTitleError.classList.remove('hidden');
    }
        
    else if (e.target.id == 'task-category') {
        if (e.target.value.length > 0) {
            check2 = true;
            taskCategoryError.classList.add('hidden');
        }

        else taskCategoryError.classList.remove('hidden');
    }

    else if (e.target.id == 'task-deadline') {
        if (e.target.value.length > 0) {
            check3 = true;
            taskDeadlineError.classList.add('hidden');
        }

        else taskDeadlineError.classList.remove('hidden');
    }
    
    else if (e.target.id == 'task-body') {
        if (e.target.value.length > 0) {
            check4 = true;
            taskBodyError.classList.add('hidden');
        }

        else taskBodyError.classList.remove('hidden');
    }       
    

    // if all checks passed, remove submit button disable
    if (check1 && check2 && check3 && check4) {
        submitBtn.disabled = false;
    }
}

taskTitle.oninput = valueCheck;
taskCategory.oninput = valueCheck;
taskDeadline.oninput = valueCheck;
taskBody.oninput = valueCheck;
