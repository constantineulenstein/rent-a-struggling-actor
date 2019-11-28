const displayExtraField = (e) => {
  const serviceInfo = document.querySelector('.new-service');
  if(e.currentTarget.value === "new-service") {
    serviceInfo.style.display = "block";
  }
  else {
    serviceInfo.style.display = "none";
  }
}


const newService = () => {
  const search = document.querySelector('#transaction_trademark_id');

  if(search) {
    search.addEventListener('change', displayExtraField )
  }
}

export { newService };
