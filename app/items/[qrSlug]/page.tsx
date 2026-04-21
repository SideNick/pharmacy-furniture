type ItemPageProps = {
  params: Promise<{
    qrSlug: string;
  }>;
};

export default async function ItemPage({ params }: ItemPageProps) {
  const { qrSlug } = await params;

  return (
    <section className="panel">
      <p className="panel__kicker">Public item page</p>
      <h2>Furniture item placeholder</h2>
      <p>
        This route represents the unique QR destination for a single furniture
        item.
      </p>
      <dl className="details">
        <div>
          <dt>QR slug</dt>
          <dd>{qrSlug}</dd>
        </div>
        <div>
          <dt>Status</dt>
          <dd>Placeholder only</dd>
        </div>
      </dl>
      <p>
        Presence confirmation, damage reporting, photo upload, and Bitrix24
        task creation will be added later.
      </p>
    </section>
  );
}

