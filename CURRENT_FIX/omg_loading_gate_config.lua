-- OMG loading gate config.
-- Edit these two values, then restart the dedicated server.
-- expected_players: how many players must fully load their data before the game continues.
--                   0 = disable the gate (old behavior).
-- timeout_seconds: how long to wait. Minimum is 30.

return {
    expected_players = 2,
    timeout_seconds = 120,
}
