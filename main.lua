function love.load()
  

  love.window.setFullscreen(true, "desktop")

  target = {}
  target.x = 300
  target.y = 300
  target.radius = 50

  score = 0
  timer = 0

  gameFont = love.graphics.newFont(40)
  start = love.timer.getTime()

end

function love.update(dt)
  current = start + love.timer.getTime()

end

function love.draw()
  if current < 16 then
    love.graphics.printf(math.floor(current), 10, 10, love.graphics.getWidth() - 25, "right")
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle("fill", target.x, target.y, target.radius)

    love.graphics.setColor(0, 255, 0)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 20, 20)
  else
    love.graphics.print("You lost, ", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    love.graphics.print(score, love.graphics.getWidth() / 2, (love.graphics.getHeight() / 2) + 75)
    
  end
end

function love.mousepressed(x, y, button, istouch, presses)
  if button == 1 then
    local mouseToTarget = distanceFromCircle(x, y, target.x, target.y)
    if mouseToTarget < target.radius then
      score = score + 1
      target.radius = math.random(5, 100)
      target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
      target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
    elseif mouseToTarget > target.radius then
      score = score - 2
      current = current + 3
      target.radius = math.random(1, 40)
      target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
      target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
    end
  end
end  

function distanceFromCircle(x1, y1, x2, y2)
  return math.sqrt((x2 - x1)^2 + (y2 - y1)^2) 
end


