module mgt

interface Event {
    start Qn
    name string
}

pub struct EventList {
pub:
    events []Event
}
