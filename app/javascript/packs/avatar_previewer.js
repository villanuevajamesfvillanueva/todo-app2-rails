function readURL(input) {
    if (input.files && input.files[0]) {
        previewContainer.innerHTML = "";
        var reader = new FileReader();
        reader.addEventListener("load", function () {
            var image = new Image();
            image.height = 160;
            image.title = input.name;
            image.src = this.result;
            previewContainer.appendChild(image);
            }, false);

        reader.readAsDataURL(input.files[0]); // convert to base64 string
            
        
    } 
}

const imageFileField = document.getElementById('image-input');
const previewContainer = document.getElementById('image-preview');

imageFileField.addEventListener('change', function() {
    readURL(this);
});
