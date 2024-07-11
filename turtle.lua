for _, filename in pairs(fs.list('/')) do
    if filename ~= 'rom' and filename ~= 'disk' and filename ~= 'openp' and filename ~= 'ppp' and filename ~= 'persistent' then
        fs.delete(filename)
    end
end

for _, filename in pairs(fs.list('/disk/turtle_files')) do
    fs.copy('/disk/turtle_files/' .. filename, '/' .. filename)
end

if fs.exists('/hub_id') then
    file = fs.open('/hub_id', 'r')
    hub_id = tonumber(file.readAll())
    file.close()
    if hub_id then
        sleep(1)
        os.reboot()
    end
end

print("Enter ID of Hub computer to link to: ")
hub_id = tonumber(read())
if hub_id == nil then
    error("Invalid ID")
end

file = fs.open('/hub_id', 'w')
file.write(hub_id)
file.close()

print("Linked")

sleep(1)
os.reboot()
