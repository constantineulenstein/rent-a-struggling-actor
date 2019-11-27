const checkIfChanged = (event) => {
    const actorInfo = document.querySelector('.actor-clicked');
    if(event.currentTarget.checked) {
      actorInfo.style.display = "block";
    }
    else {
      actorInfo.style.display = "none";
    }
  };

const showMoreIfActor = () => {
  const checkboxActor = document.querySelector('#actor');
  if (checkboxActor) {
    checkboxActor.addEventListener('change', checkIfChanged);
  }
}

export { showMoreIfActor };
