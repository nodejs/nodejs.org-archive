;(function(d,n) {
  var os = n.platform.match(/(Win|Mac|Linux)/);
  var x = n.userAgent.match(/x86_64|Win64|WOW64/) ||
          n.cpuClass === 'x64' ? 'x64' : 'x86';
  var base = 'https://nodejs.org/dist/__VERSION__/';
  var href = 'node-__VERSION__.tar.gz';
  var db = d.getElementById('downloadbutton');
  var d2;
  switch (os && os[1]) {
    case 'Mac':
      href = 'node-__VERSION__.pkg';
      break;
    case 'Win':
      href = 'node-__VERSION__-' + x + '.msi';
      if (x === 'x64') href = 'x64/' + href;
      break;

    // TODO uncomment when we have these
    // case 'Linux':
    //   // two buttons: .deb and .rpm
    //   href = 'node-__VERSION__-' + x + '.rpm';
    //   var d2 = document.createElement('a');
    //   d2.href = base + 'node-__VERSION__-' + x + '.deb';
    //   d2.className = 'button downloadbutton';
    //   d2.innerHTML = 'INSTALL .deb';
    //   db.innerHTML = 'INSTALL .rpm';
    //   db.parentNode.insertBefore(d2, db);
    //   break;
  }

  db.href = base + href;
  // if there's one download option, then download it at #download
  if (location.hash === '#download' && !d2)
    location.replace(b.href);
})(document,navigator);
