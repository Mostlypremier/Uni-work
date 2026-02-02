// Cart logic
let cart = [];

function addToCart(productName) {
    cart.push(productName);
    alert(`${productName} has been added to your cart!`);
}

// Contact form handler
function handleContactForm(event) {
    event.preventDefault();
    // Grab values
    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    const message = document.getElementById('message').value.trim();
    const formMsg = document.getElementById('formMsg');

    if (!name || !email || !message) {
        formMsg.textContent = "Please fill in all fields.";
        formMsg.style.color = "red";
        return false;
    }

    // Simulate sending
    formMsg.textContent = "Thank you for contacting us, " + name + "! We will get back to you soon.";
    formMsg.style.color = "green";

    // Optionally reset form
    document.getElementById('contactForm').reset();
    return false;
}