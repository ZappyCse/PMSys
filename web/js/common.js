function hide(t,t1){
  t1.setAttribute("src","add.png");
  t1.setAttribute("onclick","unhide('"+t+"',this)");
  document.getElementById(t).style.height="0";
  document.getElementById(t).style.padding="0";
}

function unhide(t,t1){
  t1.setAttribute("src","rem.png");
  t1.setAttribute("onclick","hide('"+t+"',this)");
  document.getElementById(t).style.height="auto";
  document.getElementById(t).style.padding="24px 18px"
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function addRow(tableId) {
  var x=document.getElementById(tableId);
  var new_row = x.rows[1].cloneNode(true);
  var len = x.rows.length;
  var inp1;
  new_row.cells[0].innerHTML=len;
  for(var i=1;i<new_row.cells.length-1;i++){
    if(new_row.cells[i].getElementsByTagName('input').length>0){
      inp1=new_row.cells[i].getElementsByTagName('input')[0];
      inp1.id+=len;
      inp1.name+=len;
      inp1.value='';
      inp1=null;
    }
    else if(new_row.cells[i].getElementsByTagName('select').length>0){
      inp1=new_row.cells[i].getElementsByTagName('select')[0];
      inp1.id+=len;
      inp1.name+=len;
      inp1.value='';
      inp1=null;
    }
  }
  x.appendChild( new_row );
}

function deleteRow(r,tableId) {
  var x = document.getElementById(tableId);
  if(x.rows.length == 2) {
    addRow(tableId);
  }
  var i = r.parentNode.parentNode.rowIndex;
  x.deleteRow(i);
  setSNO(tableId);
}

function setSNO(tableId) {
  var myTable = document.getElementById(tableId);
  var row_count = myTable.rows.length;
  for(var i = 1; i <= row_count; i++) {
    myTable.rows[i].cells[0].innerHTML = i;
  }
}