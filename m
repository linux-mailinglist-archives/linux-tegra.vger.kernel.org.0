Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF104AD86
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jun 2019 23:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729982AbfFRVrB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 17:47:01 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41006 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730489AbfFRVrB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 17:47:01 -0400
Received: by mail-ed1-f66.google.com with SMTP id p15so23836898eds.8
        for <linux-tegra@vger.kernel.org>; Tue, 18 Jun 2019 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LZrn7Rr8zleiGvdxF1w3tKSgpu14wo0qoDaXcva9cvY=;
        b=cENkHwfGotPGYAS9ExYWo2joZg+slq8McfhA3rkxAqOPj0ksLNdOTNAxpl5enwcP5V
         3cnJt6nTzVQlDqo6fcl2fBjx9ljMJMj4YNEIQPrgWbv4nTRjx9ehHycRkMOP1QVqOA4g
         P3SyvrpeP4wyJz7wm+YeVuo6sw8Bmlz8VH4z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=LZrn7Rr8zleiGvdxF1w3tKSgpu14wo0qoDaXcva9cvY=;
        b=QTMpMaiGKvdYCmqobmGuPGAf23Kcq8G+6MRLqaYkQVhUmyWAIcWw6EGcSz0Q7Y7UWX
         21pJ9iwLKqADFV5TmzAbbrPW6lPNABAdM/PD95G7ojaVuZx8Fc1usCo+BWgIDekTe+g8
         jjEE3ZYdSH6MDwge3KVLtXOWmNb+llEq0YL/8ksa4RVixaQJw8BWewS+A5uhYuwmOphM
         WsXuEhP8GpVq7O8iWAmEO+HWtYWrUJg4ezjR1oGUx92YuX12WlXwsPwvsXWcvzNoBkkA
         v3+DChnnzKZm1E28h1efuK373DQSc1APHG4Z1pjeBFYJwY/nxHnUrDB9von8K6K6IukI
         eGIA==
X-Gm-Message-State: APjAAAUN8TmraJ1PKqTaAnntKU55fMQDsGQKG1lTbx4AoVFgmVcFYJPv
        otHBZpaxlFia1MMqdO/YmicBCg==
X-Google-Smtp-Source: APXvYqwJvQ6v8diODmfivubZ8dOtPtpsb20XW5926nxdAIASSUgh96jzAqpn/te9CMxx45doYfrhew==
X-Received: by 2002:a50:8dc5:: with SMTP id s5mr128399509edh.138.1560894419613;
        Tue, 18 Jun 2019 14:46:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id h23sm869911edh.40.2019.06.18.14.46.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 14:46:58 -0700 (PDT)
Date:   Tue, 18 Jun 2019 23:46:56 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: drm connectors, tegra, and the web they weave (was Re: [PATCH
 58/59] drm/todo: Add new debugfs todo)
Message-ID: <20190618214656.GH12905@phenom.ffwll.local>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-59-daniel.vetter@ffwll.ch>
 <20190618151938.GA2567@kroah.com>
 <20190618152530.GA4576@kroah.com>
 <CAKMK7uEd0sZ81RMjDsz6cnkW+krPuvoqUcEY4U3ofB9W_qeFvA@mail.gmail.com>
 <20190618180113.GA26105@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618180113.GA26105@kroah.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 18, 2019 at 08:01:13PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 18, 2019 at 07:32:20PM +0200, Daniel Vetter wrote:
> > On Tue, Jun 18, 2019 at 5:25 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Tue, Jun 18, 2019 at 05:19:38PM +0200, Greg Kroah-Hartman wrote:
> > > > I could just "open code" a bunch of calls to debugfs_create_file() for
> > > > these drivers, which would solve this issue, but in a more "non-drm"
> > > > way.  Is it worth to just do that instead of overthinking the whole
> > > > thing and trying to squish it into the drm "model" of drm debugfs calls?
> > >
> > > An example of "open coding" this is the patch below for the sor.c
> > > driver.
> > 
> > I think open-coding is the way to go here. One of the todos is to
> > extend debugfs support for crtc/connectors, but looking at the
> > open-coded version we really don't need a drm-flavoured midlayer here.
> 
> There already is debugfs support in the code for crtc/connectors, these
> files are "hanging" off of those locations already.  I'll keep that, but
> indent it one more directory so that there's no namespace collisions.

The todo was to have some drm wrappers here for the boilerplate, but after
looking at your version that's not a good idea. So not just making sure
crtcs/connectors have a debugfs directory made for them, but more.

Wrt adding a new directory: debugfs isnt uapi, but there's usually a
massive pile of script relying on them, so it's not nice to shuffle paths
around. Plus the lifetimes match anyway (at least if you don't hotplug
connectors, which tegra doesn't do).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
