import { useState, useRef, useEffect } from 'react';
import { FaCommentDots, FaTimes, FaRobot, FaPaperPlane } from 'react-icons/fa';
import './ChatWidget.css';

const ChatWidget = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [messages, setMessages] = useState([
    { id: 1, sender: 'bot', text: 'Hello! How can I help you today?' }
  ]);
  const [inputText, setInputText] = useState('');
  const [isTyping, setIsTyping] = useState(false);
  
  // Ref for auto-scrolling
  const messagesEndRef = useRef(null);
  
  // Persist session ID in a ref so it survives re-renders but doesn't trigger them
  const sessionIdRef = useRef(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages, isTyping]);

  const toggleChat = () => {
    setIsOpen(!isOpen);
  };

  const handleSend = async (e) => {
    e.preventDefault();
    if (!inputText.trim()) return;

    const userText = inputText.trim();
    setInputText('');

    // Add user message
    const newUserMsg = { id: Date.now(), sender: 'user', text: userText };
    setMessages((prev) => [...prev, newUserMsg]);
    setIsTyping(true);

    try {
      const payload = { message: userText };
      if (sessionIdRef.current) {
        payload.session_id = sessionIdRef.current;
      }

      // Use Vercel Environment Variable, fallback to localhost
      const apiUrl = import.meta.env.VITE_API_URL || 'http://localhost:8000';
      const response = await fetch(`${apiUrl}/chat`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(payload),
      });

      if (!response.ok) {
        throw new Error('Network response was not ok');
      }

      const data = await response.json();

      // Store session ID if provided
      if (data.session_id) {
        sessionIdRef.current = data.session_id;
      }

      // Add bot message
      const botMsg = {
        id: Date.now() + 1,
        sender: 'bot',
        text: data.reply || "Sorry, I didn't understand that.",
      };
      setMessages((prev) => [...prev, botMsg]);
    } catch (error) {
      console.error('Error:', error);
      const errorMsg = {
        id: Date.now() + 1,
        sender: 'bot',
        text: "Oops! I'm having trouble connecting to the server.",
      };
      setMessages((prev) => [...prev, errorMsg]);
    } finally {
      setIsTyping(false);
    }
  };

  return (
    <div id="chat-widget-container">
      {/* Chat Window */}
      <div className={`chat-window ${isOpen ? 'open' : 'hidden'}`}>
        <div className="chat-header">
          <div className="chat-header-info">
            <div className="bot-avatar">
              <FaRobot />
            </div>
            <div>
              <h3>TekoraAI</h3>
              <span className="status">Online</span>
            </div>
          </div>
        </div>

        <div className="chat-messages">
          {messages.map((msg) => (
            <div key={msg.id} className={`message ${msg.sender}-message`}>
              <p>
                {msg.text.split(/(https?:\/\/[^\s"']+|[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+|tekoraai\.com\/?|\+?\d{1,3}[\s-]?\d{10})/g).map((part, index) => {
                  if (/^https?:\/\/[^\s"']+$/.test(part)) {
                    return <a key={index} href={part} target="_blank" rel="noopener noreferrer" style={{ color: '#a78bfa', textDecoration: 'underline', pointerEvents: 'auto' }}>{part}</a>;
                  } else if (/^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+$/.test(part)) {
                    return <a key={index} href={`mailto:${part}`} style={{ color: '#a78bfa', textDecoration: 'underline', pointerEvents: 'auto' }}>{part}</a>;
                  } else if (/^tekoraai\.com\/?$/.test(part)) {
                    return <a key={index} href={`https://${part}`} target="_blank" rel="noopener noreferrer" style={{ color: '#a78bfa', textDecoration: 'underline', pointerEvents: 'auto' }}>{part}</a>;
                  } else if (/^\+?\d{1,3}[\s-]?\d{10}$/.test(part)) {
                    return <a key={index} href={`tel:${part.replace(/[\s-]/g, '')}`} style={{ color: '#a78bfa', textDecoration: 'underline', pointerEvents: 'auto' }}>{part}</a>;
                  }
                  return part;
                })}
              </p>
            </div>
          ))}
          {isTyping && (
            <div className="typing-indicator">
              <div className="typing-dot"></div>
              <div className="typing-dot"></div>
              <div className="typing-dot"></div>
            </div>
          )}
          <div ref={messagesEndRef} />
        </div>

        <form className="chat-input-container" onSubmit={handleSend}>
          <input
            type="text"
            id="chat-input"
            placeholder="Type your message..."
            autoComplete="off"
            value={inputText}
            onChange={(e) => setInputText(e.target.value)}
          />
          <button type="submit" className="send-btn">
            <FaPaperPlane />
          </button>
        </form>
      </div>

      {/* Floating Action Button */}
      <button className="chat-fab" onClick={toggleChat} aria-label="Toggle Chat">
        {isOpen ? <FaTimes /> : <FaCommentDots />}
      </button>
    </div>
  );
};

export default ChatWidget;
