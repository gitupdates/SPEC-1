from sovereign_core import SovereignTwin

twin = SovereignTwin(name="jB0t-Q", role="Quorum Sentinel")
print(twin.respond("Status update?"))
print(twin.recall())
