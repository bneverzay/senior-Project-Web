/* Upload Picture Accommodation */
function uploadpicture(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#pictureaccommodation')
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

/* Upload Picture Accommodation */
function uploadpicturea(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imga')
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

/* ---------- Add -----------*/
/* Upload Room Picture First */
function uploadpicturefirst(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#pictureroomfirst')
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

/* Upload Room Picture Second */
function uploadpicturesecond(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#pictureroomsecond')
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

/* Upload Room Picture Third */
function uploadpicturethird(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#pictureroomthird')
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

/* Upload Room Picture Fourth */
function uploadpicturefourth(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#pictureroomfourth')
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

/* Zoom Image */
$(function () {
    $('.pop').on('click', function () {
        $('.imagepreview').attr('src', $(this).find('img').attr('src'));
        $('#imagemodal').modal('show');
    });
});