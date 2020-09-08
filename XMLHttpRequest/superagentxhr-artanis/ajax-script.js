//const superagent=require('superagent')

window.addEventListener('load', loadWindow, false)


function mode (btnID) {
 superagent.post('/ajax')
  .set('Content-Type', 'application/text')  
  .send('btn=' + btnID)
  .then(callback)
  .catch(errorCallback)
}

function callback(res){   
   let parser = new DOMParser();
   let xml = parser.parseFromString( res.text, "text/xml").getElementsByTagName("btn")[0]
   const element = document.getElementById("out")
   if(element.firstChild) element.removeChild(element.firstChild)
   element.appendChild(xml)
  }
function errorCallback(err){
    alert(res.message ) // Oh no! There has been an error with the request!
  }


function loadWindow () {
  Array.from(document.getElementsByTagName('button')).forEach(function (value, i, col) {
    col[i].onclick = function (e) { mode(e.target.id) }
  })
}

