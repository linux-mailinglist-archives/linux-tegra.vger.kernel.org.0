Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6DA41FC9F5
	for <lists+linux-tegra@lfdr.de>; Wed, 17 Jun 2020 11:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgFQJgu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Jun 2020 05:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgFQJgt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Jun 2020 05:36:49 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69ABCC061573
        for <linux-tegra@vger.kernel.org>; Wed, 17 Jun 2020 02:36:49 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g10so1179011wmh.4
        for <linux-tegra@vger.kernel.org>; Wed, 17 Jun 2020 02:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kqV7b/dRGRsaYFJFTZmEAIxbxpemJlUlmyVmWunucJQ=;
        b=a1jJ0h4Gh9g26ELV/twHuTjWpRiKFHPp8TLQgzONwinJq+v0ldA8u5Eup6Ntp0eQBq
         nc1Lpg4kzTSI9EogHgUCu6Yr5o6TiGOdyYEUUCMjtBhKeBJkCdSzbL0uqikcMECQzOVp
         Zqchdh7yOtiUOSFYENISzhvCiIXwq0wbd6SI3ndto2+BES4dRC4hLCUprwa87V2AsrtG
         WqhBE2JM8omhJa4pmFycbSidghsV633Z49FM1+QGKfYNjHFDCxSOmXRnl7+h05r/tn6p
         /DmqFKKV9v2dwcM9yR1IGCSbxzmt71MWIxNdkkqw6pfqLArKDMB6tJBJm/imJNvsP/oA
         imzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kqV7b/dRGRsaYFJFTZmEAIxbxpemJlUlmyVmWunucJQ=;
        b=PM8nJCPYnaAsfESJkHdiCDUsxJ3C3R3FyhCaAmXmMUuuUl0IrN/6ZCwRvzx1Edzkr7
         jU3WmBxwdLo05eprsHjvHVUNRILVlK9cMoxZa2WNIYzVcYQbbTxQ0KTuQsjoVCeXqe6Y
         7285r2lykOkd4hA+VcyCwv4aBmqaqZmyrdfRsv0jU9JDW5pY/LvqsqqcJd8MTex5dCQ6
         AkUaSsHrg+iygotowwac3ppHqChvXWeEHJhDr/GbKtuh3TXY05XGb4rsJSJ5W81rFuI8
         2Jk1/+IV+6D1Cn6KBBiBGJRXa5s7zNMPanhpYnvN0eJKSOzIqMwTwffkXr8XprQbFiji
         C3wA==
X-Gm-Message-State: AOAM531O1082TvK1RGOfFEvVd5zwbAIm12RGM9B1lgEZ3ff/JKkXGRzz
        Lup3kqjQWygu9O8wM65ll5z8lEl6v0LI3jLda5Qk1A==
X-Google-Smtp-Source: ABdhPJyt/DSGWPMjUA/TqeAozgDqsIajAJ3rBCfT6Uxx5ItAbPuwx37kc6zO5bdEkyBLeZ+LenZ5E1u117tWg7+oIi0=
X-Received: by 2002:a1c:bbd6:: with SMTP id l205mr7896275wmf.147.1592386608011;
 Wed, 17 Jun 2020 02:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200614200121.14147-1-digetx@gmail.com> <CACvgo51QuXMgWhFk4C=3rGvUZDX1_W0RZtVb5RtRPiHTpMebWQ@mail.gmail.com>
 <8f789ef5-bebf-c869-784d-afda70fc1fb8@gmail.com> <CACvgo50oSMbgXw1vHwVT4hhGe6g3YzKQEohCLJdfDq+0UaN1jw@mail.gmail.com>
 <646b3f37-0f72-7f3b-388f-f71dbcdd5c84@gmail.com> <CACvgo50BFH5qsPyWx9a1aZ4k5bzjSN-3KTU0BvnZ-nG-hfzKOQ@mail.gmail.com>
 <fe845434-cbf6-29d4-eeb6-8868d628fd04@gmail.com>
In-Reply-To: <fe845434-cbf6-29d4-eeb6-8868d628fd04@gmail.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Wed, 17 Jun 2020 10:34:41 +0100
Message-ID: <CAPj87rPwwHWtYpuZfiTMyELvr3D+UAY8CVnH3v6+Lo1-UMRRVA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] 180 degrees rotation support for NVIDIA Tegra DRM
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Emil Velikov <emil.l.velikov@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Derek Basehore <dbasehore@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sean Paul <sean@poorly.run>, linux-tegra@vger.kernel.org,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On Tue, 16 Jun 2020 at 22:16, Dmitry Osipenko <digetx@gmail.com> wrote:
> The panel's orientation could be parsed by any panel driver and then
> assigned as the connector's property in order to allow userspace/FB-core
> to decide what to do with the rotated display. Apparently upstream
> kernel supports only that one Samsung device which has display panel
> mounted upside-down and it already uses the custom DT properties for
> achieving the 180 rotation. So I don't quite see any panel drivers that
> instantly could benefit from using the rotation property. Perhaps I can
> add the orientation support to the panel-simple driver, but will it be
> useful to anyone?

Yes, exposing it to userspace is helpful, since Weston at least will
parse the property and then apply the correct transform:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/315

Cheers,
Daniel
