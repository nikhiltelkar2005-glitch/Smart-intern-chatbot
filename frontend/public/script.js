document.addEventListener('DOMContentLoaded', () => {
    const chatFab = document.getElementById('chat-fab');
    const chatWindow = document.getElementById('chat-window');
    const chatIcon = document.getElementById('chat-icon');
    const closeIcon = document.getElementById('close-icon');
    const chatInput = document.getElementById('chat-input');
    const sendBtn = document.getElementById('send-btn');
    const chatMessages = document.getElementById('chat-messages');

    // Toggle Chat Window
    chatFab.addEventListener('click', () => {
        chatWindow.classList.toggle('hidden');
        chatIcon.classList.toggle('hidden');
        closeIcon.classList.toggle('hidden');
        
        if (!chatWindow.classList.contains('hidden')) {
            chatInput.focus();
        }
    });

    // Store session ID to maintain conversation context
    let currentSessionId = null;

    // Handle Sending Messages
    const sendMessage = async () => {
        const text = chatInput.value.trim();
        if (!text) return;

        // 1. Add User Message to UI
        appendMessage('user', text);
        chatInput.value = '';

        // 2. Show Typing Indicator
        const typingIndicatorId = showTypingIndicator();

        try {
            // 3. Send Request to FastAPI Backend
            // Ensure your FastAPI server is running on port 8000
            const payload = { message: text };
            if (currentSessionId) {
                payload.session_id = currentSessionId;
            }

            const response = await fetch('http://localhost:8000/chat', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(payload)
            });

            if (!response.ok) {
                throw new Error('Network response was not ok');
            }

            const data = await response.json();

            // Save the session_id so we send it back next time
            if (data.session_id) {
                currentSessionId = data.session_id;
            }

            // 4. Remove Typing Indicator and Add Bot Message
            removeTypingIndicator(typingIndicatorId);
            
            // data.reply comes from your main.py FastAPI endpoint
            appendMessage('bot', data.reply || "Sorry, I didn't understand that.");

        } catch (error) {
            console.error('Error communicating with chatbot:', error);
            removeTypingIndicator(typingIndicatorId);
            appendMessage('bot', "Oops! I'm having trouble connecting to the server. Make sure the backend is running.");
        }
    };

    // Event Listeners for sending
    sendBtn.addEventListener('click', sendMessage);

    chatInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            sendMessage();
        }
    });

    // Helper functions
    function appendMessage(sender, text) {
        const msgDiv = document.createElement('div');
        msgDiv.classList.add('message');
        msgDiv.classList.add(sender === 'user' ? 'user-message' : 'bot-message');
        msgDiv.innerHTML = `<p>${escapeHTML(text)}</p>`;
        
        chatMessages.appendChild(msgDiv);
        scrollToBottom();
    }

    function showTypingIndicator() {
        const id = 'typing-' + Date.now();
        const typingDiv = document.createElement('div');
        typingDiv.id = id;
        typingDiv.classList.add('typing-indicator');
        typingDiv.innerHTML = `
            <div class="typing-dot"></div>
            <div class="typing-dot"></div>
            <div class="typing-dot"></div>
        `;
        
        chatMessages.appendChild(typingDiv);
        scrollToBottom();
        return id;
    }

    function removeTypingIndicator(id) {
        const indicator = document.getElementById(id);
        if (indicator) {
            indicator.remove();
        }
    }

    function scrollToBottom() {
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }

    // Basic HTML escaping to prevent XSS
    function escapeHTML(str) {
        return str.replace(/[&<>'"]/g, 
            tag => ({
                '&': '&amp;',
                '<': '&lt;',
                '>': '&gt;',
                "'": '&#39;',
                '"': '&quot;'
            }[tag] || tag)
        );
    }
});
