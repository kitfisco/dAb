local Living = {}
local function HumanoidAdded(Humanoid)
    if Humanoid:IsA("Humanoid") and Humanoid.Parent:IsA("Model") and Humanoid.Parent ~= LCharacter and Humanoid.Health < 10000000 then
        local character = Humanoid.Parent
        if character:FindFirstChild("HumanoidRootPart") then
            Living[character] = true
        else
            local con
            con = character.ChildAdded:Connect(function(child)
                if child.Name == "HumanoidRootPart" then
                    Living[character] = true
                    con:Disconnect()
                    con = nil
                end
            end)
        end
    end
end
workspace.DescendantAdded:Connect(HumanoidAdded)
for _,Humanoid in pairs(workspace:GetDescendants()) do
    if Humanoid:IsA("Humanoid") and Humanoid.Parent:IsA("Model") then
        task.spawn(HumanoidAdded, Humanoid)
    end
end

return Living
