const counter = document.querySelector(".counter-number")
async function updateCounter(){
    let response = await fetch("https://bnhdhqz7idnogn7wgbeacljlqy0xrlzi.lambda-url.us-east-1.on.aws/")
    let data = await response.json()
    counter.innerHTML = `Views: ${data}`;
}

updateCounter();

