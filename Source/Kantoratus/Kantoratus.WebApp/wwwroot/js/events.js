var slideIndex = [];

function addSlideShow(index) {
    slideIndex.push(1);
    showDivs(1, index);
}

function plusDivs(n, index) {
    showDivs(slideIndex[index] += n, index);
}

function showDivs(n, index) {
    var i;
    var x = document.getElementsByClassName(index);
    if (n > x.length) { slideIndex[index] = 1 }
    if (n < 1) { slideIndex[index] = x.length };
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }

    var firstImage = x[slideIndex[index] - 1];

    if (firstImage) {
        firstImage.style.display = "block";
    }
}