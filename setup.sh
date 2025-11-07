#!/bin/bash

echo "🚀 Создание Aurum AI Retro TV Menu..."
echo ""

# Очистка старых файлов
rm -rf .git *.html *.css *.js *.json *.md .gitignore 2>/dev/null

# Создаем index.html
cat > index.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aurum AI - Retro Menu</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="bg"></div>
    <div class="led"></div>
    <div class="tv">
        <div class="frame">
            <div class="bezel">
                <div class="screen">
                    <div class="scanlines"></div>
                    <div class="content">
                        <h1 class="title">AURUM AI</h1>
                        <nav class="menu">
                            <button data-action="projects"><span>⚡</span><span>Проекты и Работы</span></button>
                            <button data-action="services"><span>🎨</span><span>Услуги и Решения</span></button>
                            <button data-action="about"><span>📖</span><span>О Компании</span></button>
                            <button data-action="contact"><span>💬</span><span>Связаться</span></button>
                        </nav>
                        <div class="status"><span>STATUS: <span class="ready">ONLINE</span></span></div>
                    </div>
                </div>
            </div>
            <div class="stand"></div>
        </div>
        <button id="power">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M12 2v10M18.36 5.64a9 9 0 1 1-12.73 0"/>
            </svg>
        </button>
    </div>
    <div class="logo">AURUM</div>
    <script src="script.js"></script>
</body>
</html>
HTMLEOF

echo "✅ index.html создан"

# Создаем style.css
cat > style.css << 'CSSEOF'
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Courier New',monospace;background:linear-gradient(135deg,#0a0a0a,#1a1a1a,#2a2a2a);min-height:100vh;display:flex;align-items:center;justify-content:center;padding:20px}
.bg{position:fixed;top:0;left:0;width:100%;height:100%;background:repeating-linear-gradient(0deg,transparent,transparent 2px,rgba(255,255,255,0.03)2px,rgba(255,255,255,0.03)4px);pointer-events:none;z-index:1}
.tv{position:relative;z-index:10;max-width:900px;width:100%;animation:fadeIn 1s}
@keyframes fadeIn{from{opacity:0;transform:scale(.95)}to{opacity:1;transform:scale(1)}}
.frame{background:linear-gradient(145deg,#6a6a6a,#4a4a4a);border-radius:30px;padding:25px;box-shadow:0 20px 60px rgba(0,0,0,.8);position:relative}
.bezel{background:linear-gradient(145deg,#4a4a4a,#0a0a0a);border-radius:20px;padding:15px}
.screen{background:radial-gradient(ellipse,#1a1a1a,#0a0a0a);border-radius:15px;position:relative;overflow:hidden;aspect-ratio:16/10;box-shadow:0 0 50px rgba(0,255,255,.3)}
.scanlines{position:absolute;width:100%;height:100%;background:repeating-linear-gradient(0deg,rgba(0,0,0,.15),transparent 1px,transparent 2px,rgba(0,0,0,.15)3px);z-index:100;animation:scan 8s linear infinite}
@keyframes scan{to{transform:translateY(10px)}}
.content{position:relative;z-index:10;padding:40px 30px;height:100%;display:flex;flex-direction:column;justify-content:center;align-items:center}
.title{font-size:clamp(2rem,5vw,3.5rem);font-weight:bold;color:#0ff;text-shadow:0 0 10px #0ff,0 0 20px #0ff,2px 2px 0 #b967ff,-2px -2px 0 #0f8;margin-bottom:40px;letter-spacing:8px;animation:glitch 3s infinite}
@keyframes glitch{0%,90%,100%{transform:translateX(0)}92%{transform:translateX(-2px)skew(-2deg)}94%{transform:translateX(2px)skew(2deg)}}
.menu{display:flex;flex-direction:column;gap:15px;width:100%;max-width:500px;margin-bottom:30px}
.menu button{background:linear-gradient(145deg,#2a2a2a,#1a1a1a);border:2px solid #4a4a4a;border-radius:12px;padding:18px 25px;font-size:clamp(1rem,2.5vw,1.3rem);color:#f0f0f0;cursor:pointer;transition:.3s;display:flex;align-items:center;gap:15px;font-weight:bold}
.menu button:hover{border-color:#0ff;color:#0ff;transform:translateX(10px)scale(1.05);box-shadow:0 6px 25px rgba(0,255,255,.4)}
.status{font-size:.9rem;color:#8a8a8a;letter-spacing:2px}
.ready{color:#0f8;text-shadow:0 0 5px #0f8;animation:pulse 2s infinite}
@keyframes pulse{0%,100%{opacity:1}50%{opacity:.6}}
.stand{width:60%;height:15px;margin:15px auto 0;background:linear-gradient(145deg,#4a4a4a,#0a0a0a);border-radius:0 0 10px 10px}
#power{position:absolute;bottom:30px;right:30px;width:50px;height:50px;border-radius:50%;background:linear-gradient(145deg,#6a6a6a,#4a4a4a);border:2px solid #0a0a0a;color:#8a8a8a;cursor:pointer;transition:.3s;display:flex;align-items:center;justify-content:center}
#power:hover{color:#0ff;box-shadow:0 0 20px rgba(0,255,255,.5)}
.led{position:fixed;top:30px;right:30px;width:12px;height:12px;border-radius:50%;background:#0f8;box-shadow:0 0 10px #0f8,0 0 20px #0f8;animation:blink 2s infinite;z-index:100}
@keyframes blink{0%,100%{opacity:1}50%{opacity:.3}}
.logo{position:fixed;bottom:30px;left:30px;font-size:2rem;font-weight:bold;color:#0ff;text-shadow:0 0 10px #0ff;letter-spacing:4px;transform:rotate(-5deg);padding:10px 20px;background:rgba(0,0,0,.5);border-radius:8px;border:2px solid #4a4a4a;z-index:100}
@media(max-width:768px){.frame{padding:15px}.bezel{padding:10px}.content{padding:25px 20px}.menu button:hover{transform:scale(1.02)}}
body.off .content{opacity:0}
body.off .screen{box-shadow:none}
body.off .led{background:#2a2a2a;box-shadow:none;animation:none}
CSSEOF

echo "✅ style.css создан"

# Создаем script.js
cat > script.js << 'JSEOF'
document.addEventListener("DOMContentLoaded",()=>{const p=document.getElementById("power"),b=document.querySelectorAll(".menu button");let on=1;p.onclick=()=>{on=!on;document.body.classList.toggle("off",!on)};b.forEach(e=>{e.onclick=()=>{const m={projects:"🚀 Загрузка проектов...",services:"🎨 Открытие услуг...",about:"📖 Информация...",contact:"💬 Форма связи..."}[e.dataset.action];const n=document.createElement("div");n.textContent=m;n.style.cssText="position:fixed;top:20px;left:50%;transform:translateX(-50%);background:#1a1a1a;color:#0ff;padding:15px 30px;border-radius:10px;border:2px solid #0ff;z-index:1000;font-family:monospace;font-weight:bold";document.body.appendChild(n);setTimeout(()=>n.remove(),2500)}})});
JSEOF

echo "✅ script.js создан"

# Создаем vercel.json
cat > vercel.json << 'VEOF'
{"version":2}
VEOF

echo "✅ vercel.json создан"

# Создаем .gitignore
cat > .gitignore << 'GEOF'
.DS_Store
.vercel
*.log
GEOF

echo "✅ .gitignore создан"

# Создаем README.md
cat > README.md << 'REOF'
# 🎮 Aurum AI - Retro TV Menu
Интерактивное меню в стиле плазменного ТВ с автодеплоем на Vercel
REOF

echo "✅ README.md создан"
echo ""
echo "📦 Git инициализация..."

git init
git add .
git commit -m "🎮 Retro TV Menu"
git branch -M main
git remote add origin https://github.com/Voidessa/aurumai-intro-web.git

echo "🚀 Пушим в GitHub..."
git push -f origin main

echo ""
echo "✅ ГОТОВО! Запушено в GitHub"
echo "🔗 https://github.com/Voidessa/aurumai-intro-web"
echo ""
echo "🚀 Подключите на vercel.com для автодеплоя"