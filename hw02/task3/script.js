function lorem() {
    // Content from https://en.wikipedia.org/wiki/Lorem_ipsum
    var par1 = "<p>In publishing and graphic design, lorem ipsum is a filler text or greeking commonly used to demonstrate the textual elements of a graphic document or visual presentation. Replacing meaningful content with placeholder text allows designers to design the form of the content before the content itself has been produced.</p><p>The lorem ipsum text is typically a scrambled section of De finibus bonorum et malorum, a 1st-century BC Latin text by Cicero, with words altered, added, and removed to make it nonsensical, improper Latin.</p>  <p>A variation of the ordinary lorem ipsum text has been used in typesetting since the 1960s or earlier, when it was popularized by advertisements for Letraset transfer sheets. It was introduced to the Information Age in the mid-1980s by Aldus Corporation, which employed it in graphics and word-processing templates for its desktop publishing program PageMaker.</p><p><q>Lorem ipsum</q>text is derived from sections 1.10.33 of Cicero's De finibus bonorum et malorum.</p>";
    var div1 = document.getElementById("par1");
    div1.innerHTML = par1;
}
function bottles() {
    var par = document.getElementById("par2");
    // Content from https://en.wikipedia.org/wiki/99_Bottles_of_Beer
    par.innerHTML = "<p>99 bottles of beer on the wall, 99 bottles of beer.<br>Take one down, pass it around, 98 bottles of beer on the wall...<br>98 bottles of beer on the wall, 98 bottles of beer.<br>Take one down, pass it around, 97 bottles of beer on the wall...<br>97 bottles of beer on the wall, 97 bottles of beer.<br>Take one down, pass it around, 96 bottles of beer on the wall...<br>96 bottles of beer on the wall, 96 bottles of beer.<br>Take one down, pass it around, 95 bottles of beer on the wall...</p>"; 
}
function last() {
    var par = document.getElementById("par3");
    par.innerHTML = "<p>this is the third thing.</p>";
}