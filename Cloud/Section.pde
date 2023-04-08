class Section {
  PVector section;
  PVector pos;

  Section(float x, float y) {
    section = new PVector(x, y);
    PVector off = new PVector(random(0, 1), random(0, 1));

    pos = PVector.mult(PVector.add(section,off), unit);
  }

  ArrayList<Section> Neightbours() {
    ArrayList<Section> n = new ArrayList<Section>();

    for (Section s : sections) {
      if (abs(section.x - s.section.x) > 1.5) continue;
      if (abs(section.y - s.section.y) > 1.5) continue;

      n.add(s);
    }

    return n;
  }
}