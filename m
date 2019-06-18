Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73D3B4A8FB
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jun 2019 20:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729349AbfFRSBS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 14:01:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:44412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727616AbfFRSBS (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 14:01:18 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2B2A205F4;
        Tue, 18 Jun 2019 18:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560880876;
        bh=EJAL56xlrmUBeksBeGjUSqjS0zi77FmIgNTKq+9/7yc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BXlsULq+fxWur0HBgYhcedXTBzIW7t/hcvyg9NDYBdyCi09Fw3atbvrpsZdtSGALK
         1N5MkEwU/KPJC5bZrjzUPqX/llnJiwW85VtgtbywLmnseFBOojEhlcfG7ga3yuTFhP
         7zdtCoGWvtHMIeT15EEz40iPd1gAGbw2XPImckY4=
Date:   Tue, 18 Jun 2019 20:01:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: drm connectors, tegra, and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
Message-ID: <20190618180113.GA26105@kroah.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com>
 <20190618152530.GA4576@kroah.com>
 <CAKMK7uEd0sZ81RMjDsz6cnkW+krPuvoqUcEY4U3ofB9W_qeFvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEd0sZ81RMjDsz6cnkW+krPuvoqUcEY4U3ofB9W_qeFvA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 18, 2019 at 07:32:20PM +0200, Daniel Vetter wrote:
> On Tue, Jun 18, 2019 at 5:25 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Tue, Jun 18, 2019 at 05:19:38PM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Jun 14, 2019 at 10:36:14PM +0200, Daniel Vetter wrote:
> > > > Greg is busy already, but maybe he won't do everything ...
> > > >
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >  Documentation/gpu/todo.rst | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > > > index 9717540ee28f..026e55c517e1 100644
> > > > --- a/Documentation/gpu/todo.rst
> > > > +++ b/Documentation/gpu/todo.rst
> > > > @@ -375,6 +375,9 @@ There's a bunch of issues with it:
> > > >    this (together with the drm_minor->drm_device move) would allow us to remove
> > > >    debugfs_init.
> > > >
> > > > +- Drop the return code and error checking from all debugfs functions. Greg KH is
> > > > +  working on this already.
> > >
> > >
> > > Part of this work was to try to delete drm_debugfs_remove_files().
> > >
> > > There are only 4 files that currently still call this function:
> > >       drivers/gpu/drm/tegra/dc.c
> > >       drivers/gpu/drm/tegra/dsi.c
> > >       drivers/gpu/drm/tegra/hdmi.c
> > >       drivers/gpu/drm/tegra/sor.c
> > >
> > > For dc.c, the driver wants to add debugfs files to the struct drm_crtc
> > > debugfs directory.  Which is fine, but it has to do some special memory
> > > allocation to get the debugfs callback to point not to the struct
> > > drm_minor pointer, but rather the drm_crtc structure.
> 
> There's already a todo to switch the drm_minor debugfs stuff over to
> drm_device. drm_minor is essentially different uapi flavours (/dev/
> minor nodes, hence the name) sitting on top of the same drm_device.
> Last time I checked all the debugfs files want the drm_device, not the
> minor. I think we even discussed to only register the debugfs files
> for the first minor, and create the other ones as symlinks to the
> first one. But haven't yet gotten around to typing that.
> 
> drm_crtc/connector are parts of drm_device with modesetting support,
> so the drm_minor is even worse choice really.

Heh, ok, so the existing code is working around that choice right now,
but that wasn't a good choice, so I'll ignore it :)

> Not exactly sure why we went with this, but probably dates back to the
> *bsd compat layer and a lot of these files hanging out in procfs too
> (we've fixed those mistakes a few years ago, yay!).
> 
> > > So, to remove this call, I need to remove this special memory allocation
> > > and to do that, I need to somehow be able to cast from drm_minor back to
> > > the drm_crtc structure being used in this driver.  And I can't figure
> > > how they are related at all.
> > >
> > > Any pointers here (pun intended) would be appreciated.
> > >
> > > For the other 3 files, the situation is much the same, but I need to get
> > > from a 'struct drm_minor' pointer to a 'struct drm_connector' pointer.
> 
> Ditch the drm_minor, there's no no way to get from that to something
> like drm_connector/crtc, since it's a n:m relationship.

Ok, will do.

> 
> > > I could just "open code" a bunch of calls to debugfs_create_file() for
> > > these drivers, which would solve this issue, but in a more "non-drm"
> > > way.  Is it worth to just do that instead of overthinking the whole
> > > thing and trying to squish it into the drm "model" of drm debugfs calls?
> >
> > An example of "open coding" this is the patch below for the sor.c
> > driver.
> 
> I think open-coding is the way to go here. One of the todos is to
> extend debugfs support for crtc/connectors, but looking at the
> open-coded version we really don't need a drm-flavoured midlayer here.

There already is debugfs support in the code for crtc/connectors, these
files are "hanging" off of those locations already.  I'll keep that, but
indent it one more directory so that there's no namespace collisions.

> > Totally untested, not even built, but you should get the idea here.
> >
> > thanks,
> >
> > greg k-h
> >
> > ---------------
> >
> > diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> > index 5be5a0817dfe..3216221c77c4 100644
> > --- a/drivers/gpu/drm/tegra/sor.c
> > +++ b/drivers/gpu/drm/tegra/sor.c
> > @@ -414,7 +414,8 @@ struct tegra_sor {
> >
> >         struct drm_dp_aux *aux;
> >
> > -       struct drm_info_list *debugfs_files;
> > +       struct dentry *debugfs_root;
> > +       struct drm_device *drm;
> >
> >         const struct tegra_sor_ops *ops;
> >         enum tegra_io_pad pad;
> > @@ -1262,10 +1263,9 @@ static int tegra_sor_crc_wait(struct tegra_sor *sor, unsigned long timeout)
> >
> >  static int tegra_sor_show_crc(struct seq_file *s, void *data)
> >  {
> > -       struct drm_info_node *node = s->private;
> > -       struct tegra_sor *sor = node->info_ent->data;
> > +       struct tegra_sor *sor = s->private;
> >         struct drm_crtc *crtc = sor->output.encoder.crtc;
> > -       struct drm_device *drm = node->minor->dev;
> > +       struct drm_device *drm = sor->drm;
> >         int err = 0;
> >         u32 value;
> >
> > @@ -1302,6 +1302,20 @@ static int tegra_sor_show_crc(struct seq_file *s, void *data)
> >         return err;
> >  }
> >
> > +static int crc_open(struct inode *inode, struct file *file)
> > +{
> > +       struct tegra_sor *sor = inode->i_private;
> > +       return single_open(file, tegra_sor_show_crc, sor);
> > +}
> > +
> > +static const struct file_operations crc_fops = {
> > +       .owner = THIS_MODULE,
> > +       .open = crc_open,
> > +       .read = seq_read,
> > +       .llseek = seq_lseek,
> > +       .release = single_release,
> > +};
> 
> Hm, is there not a macro to create such simple files with read/write
> ops? At least for sysfs this is a bit less boilerplate iirc.

For "simple" things like single variables, yes, there is.

For more "free-form" text, where you want to use a seq file interface,
this seems to be the "simplest" boiler-plate to create.  Actually should
be pretty simple to create a macro for this, as it's pretty trivial (the
drm core already wraps this on its own, so it can be done...)

I'll do that too.

> >  #define DEBUGFS_REG32(_name) { .name = #_name, .offset = _name }
> >
> >  static const struct debugfs_reg32 tegra_sor_regs[] = {
> > @@ -1424,10 +1438,9 @@ static const struct debugfs_reg32 tegra_sor_regs[] = {
> >
> >  static int tegra_sor_show_regs(struct seq_file *s, void *data)
> >  {
> > -       struct drm_info_node *node = s->private;
> > -       struct tegra_sor *sor = node->info_ent->data;
> > +       struct tegra_sor *sor = s->private;
> >         struct drm_crtc *crtc = sor->output.encoder.crtc;
> > -       struct drm_device *drm = node->minor->dev;
> > +       struct drm_device *drm = sor->drm;
> 
> sor->output.connector.dev should give you this already. And I think
> getting at the drm_device is the only reason we needed the drm_minor
> here at all.

Ah, good, I missed that, should make this code simpler then, thanks!


> 
> >         unsigned int i;
> >         int err = 0;
> >
> > @@ -1450,51 +1463,44 @@ static int tegra_sor_show_regs(struct seq_file *s, void *data)
> >         return err;
> >  }
> >
> > -static const struct drm_info_list debugfs_files[] = {
> > -       { "crc", tegra_sor_show_crc, 0, NULL },
> > -       { "regs", tegra_sor_show_regs, 0, NULL },
> > +static int regs_open(struct inode *inode, struct file *file)
> > +{
> > +       struct tegra_sor *sor = inode->i_private;
> > +       return single_open(file, tegra_sor_show_regs, sor);
> > +}
> > +
> > +static const struct file_operations crc_fops = {
> > +       .owner = THIS_MODULE,
> > +       .open = crc_open,
> > +       .read = seq_read,
> > +       .llseek = seq_lseek,
> > +       .release = single_release,
> >  };
> >
> >  static int tegra_sor_late_register(struct drm_connector *connector)
> >  {
> > -       struct tegra_output *output = connector_to_output(connector);
> > -       unsigned int i, count = ARRAY_SIZE(debugfs_files);
> >         struct drm_minor *minor = connector->dev->primary;
> > -       struct dentry *root = connector->debugfs_entry;
> > +       struct tegra_output *output = connector_to_output(connector);
> >         struct tegra_sor *sor = to_sor(output);
> > -       int err;
> > +       struct dentry *root;
> >
> > -       sor->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
> > -                                    GFP_KERNEL);
> > -       if (!sor->debugfs_files)
> > -               return -ENOMEM;
> > +       sor->drm = minor->dev;
> >
> > -       for (i = 0; i < count; i++)
> > -               sor->debugfs_files[i].data = sor;
> > +       root = debugfs_create_dir("sor", connector->debugfs_entry);
> 
> Hm I think the old files got created right in the
> drm_connector->debugfs_entry directory?

They did.  I was trying to be nice and keep things in their own
directory so I could clean it up.  But I guess we want the drm core to
be cleaning things up, I forgot about drm_debugfs_remove_files() being
the main goal to get rid of here :)

> > +       sor->debugfs_root = root;
> >
> > -       err = drm_debugfs_create_files(sor->debugfs_files, count, root, minor);
> > -       if (err < 0)
> > -               goto free;
> > +       debugfs_create_file("crc", S_IFREG | S_IRUGO, root, sor, &crc_fops);
> > +       debugfs_create_file("regs", S_IFREG | S_IRUGO, root, sor, &regs_fops);
> >
> >         return 0;
> > -
> > -free:
> > -       kfree(sor->debugfs_files);
> > -       sor->debugfs_files = NULL;
> > -
> > -       return err;
> >  }
> 
> I think if you can create a debugfs-simple-file macro, this here would
> win hands-down from a boilerplate pov. I like.

Ok, will do.

> >  static void tegra_sor_early_unregister(struct drm_connector *connector)
> >  {
> >         struct tegra_output *output = connector_to_output(connector);
> > -       unsigned int count = ARRAY_SIZE(debugfs_files);
> >         struct tegra_sor *sor = to_sor(output);
> >
> > -       drm_debugfs_remove_files(sor->debugfs_files, count,
> > -                                connector->dev->primary);
> > -       kfree(sor->debugfs_files);
> > -       sor->debugfs_files = NULL;
> > +       debugfs_remove_recursive(sor->debugfs_root);
> 
> Not needed, we tear down everything as part of drm_dev_unregister
> anyway. So you can ditch this.

Wonderful, will do.

thanks for the review.

greg k-h
