var right = document.getElementsByClassName("right");
function lorem() {
    // Content from https://en.wikipedia.org/wiki/Lorem_ipsum
    var par1 = "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vulputate felis convallis, commodo metus non, gravida dolor. Aenean sem ipsum, imperdiet non rhoncus non, semper et leo. Integer nunc lacus, luctus ut finibus vitae, tincidunt ac nibh. Suspendisse cursus diam eget elit lobortis auctor. Morbi ullamcorper urna justo, ac fermentum nisi efficitur eget. Etiam accumsan, sapien ac ultricies sodales, nunc magna sodales nisi, sit amet fringilla felis diam a dui. Maecenas faucibus neque bibendum nulla efficitur egestas. Cras tincidunt rutrum elementum. Phasellus at aliquam nisi, nec dapibus sem.</p>";
    var par2 = "<p>Suspendisse ac tristique sem. Morbi convallis pretium quam nec dapibus. Aliquam sit amet efficitur orci. Sed non auctor mauris. Morbi quis magna non magna maximus blandit. Nunc in ex placerat felis fringilla lobortis vitae eget lectus. Aenean ac sagittis purus. Etiam aliquet, nunc eget sollicitudin tristique, quam ligula sodales nibh, non tempus magna velit eu risus. Quisque id lectus risus. Nam consequat arcu sit amet augue porttitor malesuada ac eget tellus. Nunc sit amet lectus sit amet massa fringilla malesuada. In hac habitasse platea dictumst. Sed faucibus leo vel neque cursus convallis. Vivamus id est at elit blandit elementum.</p>";
    var par3 = "<p>Donec volutpat volutpat eleifend. Etiam dignissim lacus ac lectus sodales auctor. Suspendisse in augue convallis, pulvinar lorem vel, hendrerit arcu. Sed lectus turpis, auctor vitae ante non, lobortis vulputate eros. Proin consectetur urna a neque vehicula consectetur. Nulla lorem arcu, consectetur sit amet nunc in, commodo euismod augue. Mauris nec mauris dolor. Aenean dictum mi leo, sed mattis nulla gravida et. Morbi at leo sed odio blandit luctus. Donec viverra ligula quis accumsan consequat. Duis aliquam enim vel urna laoreet condimentum. Sed porta molestie vehicula. Maecenas facilisis arcu quis euismod pretium. Donec turpis augue, viverra non tortor vel, porttitor pretium dolor. Fusce non vehicula metus.</p>";
    var par4 = "<p>In vehicula nec arcu et condimentum. Nunc risus mauris, tempus at aliquet eget, scelerisque sed tortor. Vivamus vulputate dolor vitae nulla congue vehicula. Vivamus consectetur, diam non blandit tempus, odio ipsum accumsan erat, a laoreet justo sem eu ante. Quisque massa arcu, scelerisque accumsan fringilla et, placerat sed augue. Sed a tellus euismod, faucibus turpis et, aliquet tortor. Suspendisse convallis diam id sem viverra, nec rutrum orci hendrerit. Pellentesque mollis justo eu nisi molestie maximus. Suspendisse vel fringilla elit. Etiam scelerisque sagittis suscipit. Proin sit amet neque efficitur odio commodo mattis. Cras lobortis accumsan fermentum.</p>";
    right[0].innerHTML = par1 + par2 + par3 + par4;
}
function bottles() {
    // Content from https://en.wikipedia.org/wiki/99_Bottles_of_Beer
    right[0].innerHTML = "<p>99 bottles of beer on the wall, 99 bottles of beer.<br>Take one down, pass it around, 98 bottles of beer on the wall...<br>98 bottles of beer on the wall, 98 bottles of beer.<br>Take one down, pass it around, 97 bottles of beer on the wall...<br>97 bottles of beer on the wall, 97 bottles of beer.<br>Take one down, pass it around, 96 bottles of beer on the wall...<br>96 bottles of beer on the wall, 96 bottles of beer.<br>Take one down, pass it around, 95 bottles of beer on the wall...</p>"; 
}
function last() {
    right[0].innerHTML = "<p>this is the third thing.</p>";
}