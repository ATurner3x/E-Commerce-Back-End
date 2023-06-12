const router = require('express').Router();
const { Tag, Product, ProductTag } = require('../../models');

// The `/api/tags` endpoint



router.get('/', (req, res) => {
  try {
  // find all tags
  // be sure to include its associated Product data
  const tags = await Tag.findAll({
    include: [Product]
});
res.json(tags);
  } catch (err) {
    console.error(err);
    res.status(500).json(err);
  }
});

router.get('/:id', (req, res) => {
  try {
  // find a single tag by its `id`
  // be sure to include its associated Product data
  const tag = await Tag.findByPk(req.params.id, {
    include: [Product]
});
if (!tag) {
  res.status(404).json({ message: 'Tag not found' });
  return;
}
res.json(tag);
} catch (err) {
console.error(err);
res.status(500).json(err);
}
});



router.post('/', (req, res) => {
  try {
  // create a new tag
  const tag = await Tag.create(req.body);
  res.status(201).json(tag);
} catch (err) {
  console.error(err);
  res.status(500).json(err);
}
});

router.put('/:id', (req, res) => {
  // update a tag's name by its `id` value
});

router.delete('/:id', (req, res) => {
  // delete on tag by its `id` value
});

module.exports = router;
