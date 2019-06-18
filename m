Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E6A4A877
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jun 2019 19:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfFRRcd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 13:32:33 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33041 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729337AbfFRRcd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 13:32:33 -0400
Received: by mail-ot1-f67.google.com with SMTP id p4so6270356oti.0
        for <linux-tegra@vger.kernel.org>; Tue, 18 Jun 2019 10:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EKu5pmQOusob9IpFJMSHf1IH3Ni0klBpt0miLowK0K0=;
        b=jjYe7p8SQ8u4LnggZnHee8ecQK7UTaDZV4BCcw098lVLiWO40f7Eteczo+oKOGnTMx
         rKfulwovaxtSqbaglv18CNCNt8NahqLq6nn5QB1eViGSDSoCtqRpcRCRJJGy3Wfw9G5f
         L7a3Vw/oHfSgsH1mc+QmxChEhpmIQtMqUxI3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EKu5pmQOusob9IpFJMSHf1IH3Ni0klBpt0miLowK0K0=;
        b=UWHMyhhh+HtMxwB5fBu8Xv3nhfTbm09FI9LFek/cVtGlZl6U1Qua0Q0wtS1pLVU6ed
         a8E33TR7x6E72Th39T5RcfOFR3b/w08TkWIQjBDuQcLJ5uGPDwwSb5158+fmiEVFV/XT
         fMb4034VrpYzDyiMjWoYHhgtTkVUMoFgXGcbHhO67/nYq7OA0vjg8iPQWRTtCT+nEXX9
         ajL1z9fgYwJQi9+QmenuPSjkC/IwB6/wqh4bmc8SNSJMblIb4P0wSGM+CY59Vr0iZAzb
         6Fn9SCoBfll4ckA6eS1A66OzPgsEnAC2lWTIn4RBP5KL38asp8cgxpOJtwh4+is5zbbI
         H3Dg==
X-Gm-Message-State: APjAAAUpxO0bPJVkxPoIfrfPXqX1HYfv+EqRL+I9/1R865VzKqxTtxx3
        sDlla0Lfs0ZqacVVVSuUd6u0PpG/dnqYiW8Tatw84w==
X-Google-Smtp-Source: APXvYqzF+F/kjYWtANF28v6zLvX3IsDKCejh4tKGV10zC+oBZ3KLhvHxbML/cuCRuvnqxOLGqngKj6+ctU4pDvVPFM4=
X-Received: by 2002:a9d:6644:: with SMTP id q4mr52320266otm.308.1560879152643;
 Tue, 18 Jun 2019 10:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch> <20190618151938.GA2567@kroah.com>
 <20190618152530.GA4576@kroah.com>
In-Reply-To: <20190618152530.GA4576@kroah.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 18 Jun 2019 19:32:20 +0200
Message-ID: <CAKMK7uEd0sZ81RMjDsz6cnkW+krPuvoqUcEY4U3ofB9W_qeFvA@mail.gmail.com>
Subject: Re: drm connectors, tegra, and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 18, 2019 at 5:25 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Jun 18, 2019 at 05:19:38PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jun 14, 2019 at 10:36:14PM +0200, Daniel Vetter wrote:
> > > Greg is busy already, but maybe he won't do everything ...
> > >
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  Documentation/gpu/todo.rst | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > > index 9717540ee28f..026e55c517e1 100644
> > > --- a/Documentation/gpu/todo.rst
> > > +++ b/Documentation/gpu/todo.rst
> > > @@ -375,6 +375,9 @@ There's a bunch of issues with it:
> > >    this (together with the drm_minor->drm_device move) would allow us to remove
> > >    debugfs_init.
> > >
> > > +- Drop the return code and error checking from all debugfs functions. Greg KH is
> > > +  working on this already.
> >
> >
> > Part of this work was to try to delete drm_debugfs_remove_files().
> >
> > There are only 4 files that currently still call this function:
> >       drivers/gpu/drm/tegra/dc.c
> >       drivers/gpu/drm/tegra/dsi.c
> >       drivers/gpu/drm/tegra/hdmi.c
> >       drivers/gpu/drm/tegra/sor.c
> >
> > For dc.c, the driver wants to add debugfs files to the struct drm_crtc
> > debugfs directory.  Which is fine, but it has to do some special memory
> > allocation to get the debugfs callback to point not to the struct
> > drm_minor pointer, but rather the drm_crtc structure.

There's already a todo to switch the drm_minor debugfs stuff over to
drm_device. drm_minor is essentially different uapi flavours (/dev/
minor nodes, hence the name) sitting on top of the same drm_device.
Last time I checked all the debugfs files want the drm_device, not the
minor. I think we even discussed to only register the debugfs files
for the first minor, and create the other ones as symlinks to the
first one. But haven't yet gotten around to typing that.

drm_crtc/connector are parts of drm_device with modesetting support,
so the drm_minor is even worse choice really.

Not exactly sure why we went with this, but probably dates back to the
*bsd compat layer and a lot of these files hanging out in procfs too
(we've fixed those mistakes a few years ago, yay!).

> > So, to remove this call, I need to remove this special memory allocation
> > and to do that, I need to somehow be able to cast from drm_minor back to
> > the drm_crtc structure being used in this driver.  And I can't figure
> > how they are related at all.
> >
> > Any pointers here (pun intended) would be appreciated.
> >
> > For the other 3 files, the situation is much the same, but I need to get
> > from a 'struct drm_minor' pointer to a 'struct drm_connector' pointer.

Ditch the drm_minor, there's no no way to get from that to something
like drm_connector/crtc, since it's a n:m relationship.

> > I could just "open code" a bunch of calls to debugfs_create_file() for
> > these drivers, which would solve this issue, but in a more "non-drm"
> > way.  Is it worth to just do that instead of overthinking the whole
> > thing and trying to squish it into the drm "model" of drm debugfs calls?
>
> An example of "open coding" this is the patch below for the sor.c
> driver.

I think open-coding is the way to go here. One of the todos is to
extend debugfs support for crtc/connectors, but looking at the
open-coded version we really don't need a drm-flavoured midlayer here.

> Totally untested, not even built, but you should get the idea here.
>
> thanks,
>
> greg k-h
>
> ---------------
>
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 5be5a0817dfe..3216221c77c4 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -414,7 +414,8 @@ struct tegra_sor {
>
>         struct drm_dp_aux *aux;
>
> -       struct drm_info_list *debugfs_files;
> +       struct dentry *debugfs_root;
> +       struct drm_device *drm;
>
>         const struct tegra_sor_ops *ops;
>         enum tegra_io_pad pad;
> @@ -1262,10 +1263,9 @@ static int tegra_sor_crc_wait(struct tegra_sor *sor, unsigned long timeout)
>
>  static int tegra_sor_show_crc(struct seq_file *s, void *data)
>  {
> -       struct drm_info_node *node = s->private;
> -       struct tegra_sor *sor = node->info_ent->data;
> +       struct tegra_sor *sor = s->private;
>         struct drm_crtc *crtc = sor->output.encoder.crtc;
> -       struct drm_device *drm = node->minor->dev;
> +       struct drm_device *drm = sor->drm;
>         int err = 0;
>         u32 value;
>
> @@ -1302,6 +1302,20 @@ static int tegra_sor_show_crc(struct seq_file *s, void *data)
>         return err;
>  }
>
> +static int crc_open(struct inode *inode, struct file *file)
> +{
> +       struct tegra_sor *sor = inode->i_private;
> +       return single_open(file, tegra_sor_show_crc, sor);
> +}
> +
> +static const struct file_operations crc_fops = {
> +       .owner = THIS_MODULE,
> +       .open = crc_open,
> +       .read = seq_read,
> +       .llseek = seq_lseek,
> +       .release = single_release,
> +};

Hm, is there not a macro to create such simple files with read/write
ops? At least for sysfs this is a bit less boilerplate iirc.

> +
>  #define DEBUGFS_REG32(_name) { .name = #_name, .offset = _name }
>
>  static const struct debugfs_reg32 tegra_sor_regs[] = {
> @@ -1424,10 +1438,9 @@ static const struct debugfs_reg32 tegra_sor_regs[] = {
>
>  static int tegra_sor_show_regs(struct seq_file *s, void *data)
>  {
> -       struct drm_info_node *node = s->private;
> -       struct tegra_sor *sor = node->info_ent->data;
> +       struct tegra_sor *sor = s->private;
>         struct drm_crtc *crtc = sor->output.encoder.crtc;
> -       struct drm_device *drm = node->minor->dev;
> +       struct drm_device *drm = sor->drm;

sor->output.connector.dev should give you this already. And I think
getting at the drm_device is the only reason we needed the drm_minor
here at all.

>         unsigned int i;
>         int err = 0;
>
> @@ -1450,51 +1463,44 @@ static int tegra_sor_show_regs(struct seq_file *s, void *data)
>         return err;
>  }
>
> -static const struct drm_info_list debugfs_files[] = {
> -       { "crc", tegra_sor_show_crc, 0, NULL },
> -       { "regs", tegra_sor_show_regs, 0, NULL },
> +static int regs_open(struct inode *inode, struct file *file)
> +{
> +       struct tegra_sor *sor = inode->i_private;
> +       return single_open(file, tegra_sor_show_regs, sor);
> +}
> +
> +static const struct file_operations crc_fops = {
> +       .owner = THIS_MODULE,
> +       .open = crc_open,
> +       .read = seq_read,
> +       .llseek = seq_lseek,
> +       .release = single_release,
>  };
>
>  static int tegra_sor_late_register(struct drm_connector *connector)
>  {
> -       struct tegra_output *output = connector_to_output(connector);
> -       unsigned int i, count = ARRAY_SIZE(debugfs_files);
>         struct drm_minor *minor = connector->dev->primary;
> -       struct dentry *root = connector->debugfs_entry;
> +       struct tegra_output *output = connector_to_output(connector);
>         struct tegra_sor *sor = to_sor(output);
> -       int err;
> +       struct dentry *root;
>
> -       sor->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
> -                                    GFP_KERNEL);
> -       if (!sor->debugfs_files)
> -               return -ENOMEM;
> +       sor->drm = minor->dev;
>
> -       for (i = 0; i < count; i++)
> -               sor->debugfs_files[i].data = sor;
> +       root = debugfs_create_dir("sor", connector->debugfs_entry);

Hm I think the old files got created right in the
drm_connector->debugfs_entry directory?

> +       sor->debugfs_root = root;
>
> -       err = drm_debugfs_create_files(sor->debugfs_files, count, root, minor);
> -       if (err < 0)
> -               goto free;
> +       debugfs_create_file("crc", S_IFREG | S_IRUGO, root, sor, &crc_fops);
> +       debugfs_create_file("regs", S_IFREG | S_IRUGO, root, sor, &regs_fops);
>
>         return 0;
> -
> -free:
> -       kfree(sor->debugfs_files);
> -       sor->debugfs_files = NULL;
> -
> -       return err;
>  }

I think if you can create a debugfs-simple-file macro, this here would
win hands-down from a boilerplate pov. I like.

>  static void tegra_sor_early_unregister(struct drm_connector *connector)
>  {
>         struct tegra_output *output = connector_to_output(connector);
> -       unsigned int count = ARRAY_SIZE(debugfs_files);
>         struct tegra_sor *sor = to_sor(output);
>
> -       drm_debugfs_remove_files(sor->debugfs_files, count,
> -                                connector->dev->primary);
> -       kfree(sor->debugfs_files);
> -       sor->debugfs_files = NULL;
> +       debugfs_remove_recursive(sor->debugfs_root);

Not needed, we tear down everything as part of drm_dev_unregister
anyway. So you can ditch this.

>  }
>
>  static void tegra_sor_connector_reset(struct drm_connector *connector)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
