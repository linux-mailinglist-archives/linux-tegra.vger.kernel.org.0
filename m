Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72AE51A8DBD
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Apr 2020 23:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633917AbgDNVcu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Apr 2020 17:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633905AbgDNVci (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Apr 2020 17:32:38 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC34C061A0C
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 14:32:37 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x4so14803279wmj.1
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 14:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t5m6M/9+YygcM4K7PMvy/NZ60v8zZsa/xnL9yo9yJ58=;
        b=knESGuyCdcFB6IUeVZwlSQm41whW6aRwkz9x3XwRta1pWEb7kfXl/lvTozWwGiuU6T
         1MhfiKqa/oQbI3l6kemBpiXLxH0sStZE33CVj4sipZgBzYWxUn5nEcr5D6FB/wsFHZCG
         /aRwXhQDUqkj8xgtPXr32A0rxW2nXCL4GJFDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t5m6M/9+YygcM4K7PMvy/NZ60v8zZsa/xnL9yo9yJ58=;
        b=aWFkJN3uzJJb7AyL6jcJ0BMRDXTpFAjDvWTMegaTtjjgwu5lotkEiLqSh1Fwjfb1rg
         PGj25t4N0apdhkDDo2ChaApyUc0jqX/NKik3V9kXa+KB1jsHkvnf3xrPhMv0RtUSWmH8
         XCFWd93flTLlhhUXhCstSdbsZh0QiSpRqRf6k+Z9XtBjNYynvESyhL7O+AxvX6eNIK0p
         URAmo/K1jXG/rVnYUayBSpzgaVoE0HkCEqaK0ctAn57HMKEe8xWlte4qLdHX8jZM5yM3
         W9aDObQccyEpTfHt8qVZsTtDHBAftMPG6r1zrV1Ve9B40qVL5D8Dh6ngiKIH7RYFknEw
         uRdQ==
X-Gm-Message-State: AGi0Pua4frdovKXSicvbb6LpkLpKeoh/AeJH3w/ji+8Zkmq55AE+T7Ov
        iQoZinJcDri9i5qYW2aq4nzuX8R+yvjz2IpuBYdYsQ==
X-Google-Smtp-Source: APiQypI9rjKKB0RYbteCLC4VAV7bY9ZO0QuxCkN6ifXQN4cR85Hq47ciMy/omqQRLYy5BvobGQ/H/gfFhjGxNKYju/g=
X-Received: by 2002:a1c:f205:: with SMTP id s5mr1771238wmc.101.1586899955742;
 Tue, 14 Apr 2020 14:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200306002112.255361-1-dbasehore@chromium.org>
 <ecbfb5f8-615a-4a88-5dac-de17158125bf@gmail.com> <CAGAzgsqpjZxh7PEL_Dy7HrFeFGm7+=F6cL3QG9KmK9CHvDWZ9g@mail.gmail.com>
 <6dc9ef16-9671-6ce8-27e6-aa1f4c009ee2@gmail.com>
In-Reply-To: <6dc9ef16-9671-6ce8-27e6-aa1f4c009ee2@gmail.com>
From:   "dbasehore ." <dbasehore@chromium.org>
Date:   Tue, 14 Apr 2020 14:32:24 -0700
Message-ID: <CAGAzgsrNrq+S+-5KEFVnJn6S5DRn1fKkToD5=KR911T9AOAF-w@mail.gmail.com>
Subject: Re: [PATCH v10 0/2] Panel rotation patches
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Apr 14, 2020 at 2:18 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 14.04.2020 22:32, dbasehore . =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi Dmitry, sorry for the late reply.
> >
> > On Sun, Mar 8, 2020 at 12:25 PM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >>
> >> 06.03.2020 03:21, Derek Basehore =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> This adds the plumbing for reading panel rotation from the devicetree
> >>> and sets up adding a panel property for the panel orientation on
> >>> Mediatek SoCs when a rotation is present.
> >>
> >> Hello Derek and everyone,
> >>
> >> I'm looking at adding display rotation support to NVIDIA Tegra DRM
> >> driver because some devices have display panel physically mounted
> >> upside-down, and thus, display controller's scan-out needs to be rotat=
ed
> >> by 180=C2=B0 in this case.
> >>
> >> Derek, yours panel-rotation patches add support for assigning panel's
> >> orientation to the connector, but then only primary display plane
> >> receives rotation value in [1], while rotation needs to be applied to
> >> all available overlay/cursor planes and this should happen in other
> >> places than [1] as well.
> >
> > This is intended. We don't correct the output in the kernel. We
> > instead rely on notifying userspace that the panel is rotated, then we
> > handle it there.
> >
> >>
> >> [1] drm_client_modeset_commit_atomic()
> >>
> >> Please also note that in a case of the scan-out rotation, plane's
> >> coordinates need to be changed in accordance to the display's rotation=
.
> >>
> >> I looked briefly through the DRM code and my understanding that the DR=
M
> >> core currently doesn't support use-case where scan-out needs to rotate=
d
> >> based on a panel's orientation, correct? Is it the use-case you're
> >> working on for the Mediatek driver?
> >
> > Yes, we rely on userspace to rotate the output. The major reason for
> > this is because there may not be a "free" hardware rotation that can
> > be applied to the overlay. Sean Paul and others also preferred that
> > userspace control what is output to the screen instead of the kernel
> > taking care of it. This code just adds the drm property to the panel.
> >
>
> Could you please explain what that userspace is?

This was added for Chrome OS, which uses its own graphics stack,
Ozone, instead of Xorg.

>
> AFAIK, things like Xorg modesetting don't support that orientation proper=
ty.
