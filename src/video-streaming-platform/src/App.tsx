import React, { useState } from 'react';
import './App.css';
import VideoPlayer from './components/VideoPlayer';

const App: React.FC = () => {
  const [videoUrl, setVideoUrl] = useState<string>('');

  const handleVideoSelect = (url: string) => {
    setVideoUrl(url);
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>Video Streaming Platform</h1>
      </header>
      <div className="video-container">
        {videoUrl ? (
          <VideoPlayer url={videoUrl} />
        ) : (
          <p>Select a video to play</p>
        )}
      </div>
      <div className="video-list">
        <h2>Available Videos</h2>
        <ul>
          <li onClick={() => handleVideoSelect('https://www.example.com/video1.mp4')}>Video 1</li>
          <li onClick={() => handleVideoSelect('https://www.example.com/video2.mp4')}>Video 2</li>
        </ul>
      </div>
    </div>
  );
};

export default App;

