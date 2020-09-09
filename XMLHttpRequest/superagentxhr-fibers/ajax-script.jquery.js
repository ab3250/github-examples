//const superagent=require('superagent')

window.addEventListener('load', loadWindow, false)

function mode (btnID){
$.ajax({
    type: "post",
    url: "/ajax",
    data: { name: "John", time: "2pm" },
    contentType: 'application/json',
    traditional: true,
    processData: false,
    success: function(data, status){
      alert(data)
      let parser = new DOMParser();
      let xml = parser.parseFromString( data, "text/xml").getElementsByTagName("btn")[0]
      const element = document.getElementById("out")
      if(element.firstChild) element.removeChild(element.firstChild)
      element.appendChild(xml)
      },
    dataType: 'plainObject'
  })
}
function loadWindow () {
  Array.from(document.getElementsByTagName('button')).forEach(function (value, i, col) {
    col[i].onclick = function (e) { mode(e.target.id) }
    })
  }

