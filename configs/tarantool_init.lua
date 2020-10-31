box.cfg
{
    pid_file = nil,
    background = false,
    log_level = 5
}

if not box.space.users then
  box.schema.space.create('users')
  box.space.users:format({
    { name = 'id', type = 'uuid' },
    { name = 'name', type = 'string' }
  })
  box.space.users:create_index('primary', {
    type = 'hash',
    parts = {'id'}
  })
end

if not box.space.sessions then
  box.schema.space.create('sessions')
  box.space.sessions:format({
    { name = 'id', type = 'uuid' },
    { name = 'start', type = 'unsigned' },
    { name = 'duration', type = 'unsigned' },
    { name = 'user_id', type = 'uuid' }
  })
  box.space.sessions:create_index('primary', {
    type = 'hash',
    parts = { 'id' }
  })
end

if not box.space.rooms then
  box.schema.space.create('rooms')
  box.space.rooms:format({
    { name = 'id', type = 'uuid' },
    { name = 'participants', type = 'array' },
    { name = 'currentCount', type = 'integer' }
  })
  box.space.rooms:create_index('primary', {
    type = 'hash',
    parts = {'id'}
  })
end
