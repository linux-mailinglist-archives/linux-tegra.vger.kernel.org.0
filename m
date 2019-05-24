Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2113F29AE5
	for <lists+linux-tegra@lfdr.de>; Fri, 24 May 2019 17:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389435AbfEXPVP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 May 2019 11:21:15 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52792 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389079AbfEXPVP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 May 2019 11:21:15 -0400
Received: by mail-wm1-f65.google.com with SMTP id y3so9821321wmm.2
        for <linux-tegra@vger.kernel.org>; Fri, 24 May 2019 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z0n3xscdT5tjZjNABlDhyi59ToxPXKWRSC1PEc2N1vo=;
        b=Cg4ikwx3uIhHhcVDDT8OzO1sANiceBX/o63nUbOrsDPUV8QkwAtqZtqw6t+m9wf2Kv
         WTTRKEMiU7BhSvW/3ATKPM2xH+TUZtoO1jsvvtrM598BDFpP9AWmCioZH2nXxbyM+0AU
         QwXcw1RE1F+zKMjlf0CW0Wmp08rXt4aQNbHnnIWYuELfS3FPHRKECeCNemvnoqxmYGrW
         z6Hm+O41YYMi7Qe7jibJdZUR/vIydxFmWeJvbzZmYrpusKlGmuNNiMlGRhHCDCH9bbrZ
         TbTfeBfeSxpZKjuSPsSvOOlKIpNnx6y6qrN9aLtyV5ifjuhld+7p1p9HfTNzWYtKf/Qt
         2OpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z0n3xscdT5tjZjNABlDhyi59ToxPXKWRSC1PEc2N1vo=;
        b=b0zPztF+VyKpOALD69TqNnpaWt2ADRDDgp2oJgI+S71Toz9Qj1oy4jNfF7Saw2ShGw
         iqf3xozqSeQQAddFRiHVqyaD7UnzcaMiEUn4kt7/0uq7dfuztdIHQUew9a/4YlnMxxyt
         sey3WXoTfSilJfSBHg/hfR2seJXC8OomeBvx+T2k9bAuhX4oC+dNAxEah9QcsLQbESFE
         BY75z5zPih8Xj0uXhR9vlaYuPGfGMQogTeDwzJKGQuJLh4RSusnnI+5itQlZUqEHH1mB
         0mpqqGEqWHhbXeS3NlAbxLEYfqDH/XBgQMggvtcv9/AHWvcp6k4CBaePXgZTPAfrCnVC
         mNkw==
X-Gm-Message-State: APjAAAXV8Mbz5WXMclY0JJ+B15bZTKpQuAyxUSZyInOxenu+aP25cla8
        XQKyiD0NYKPqM8v4exc9GaY=
X-Google-Smtp-Source: APXvYqw/tjSQC/yLPiP22aq0AwQVRX1KiMl6mSXoSrGriw2BGcoK0e1mSjtS0FLb4tUQTf0ip+ujvw==
X-Received: by 2002:a1c:3:: with SMTP id 3mr17492373wma.44.1558711273403;
        Fri, 24 May 2019 08:21:13 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
        by smtp.gmail.com with ESMTPSA id g13sm3307837wrw.63.2019.05.24.08.21.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 24 May 2019 08:21:12 -0700 (PDT)
Date:   Fri, 24 May 2019 16:19:52 +0100
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Thierry Reding <treding@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, kernel@collabora.com,
        linux-tegra@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] drm/tegra: remove irrelevant DRM_UNLOCKED flag
Message-ID: <20190524151952.GC8938@arch-x1c3>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
 <20190523091555.GA18130@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523091555.GA18130@ulmo>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2019/05/23, Thierry Reding wrote:
> On Wed, May 22, 2019 at 04:46:59PM +0100, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> > 
> > DRM_UNLOCKED doesn't do anything for non-legacy drivers. Remove it.
> > 
> > Cc: Thierry Reding <treding@nvidia.com>
> > Cc: linux-tegra@vger.kernel.org
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> I assume you want to take this through drm-misc? In that case:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
> Otherwise let me know and I'll pick it up into the Tegra tree.
> 
Yes, I'll pick it up through drm-misc.

Thanks
Emil


