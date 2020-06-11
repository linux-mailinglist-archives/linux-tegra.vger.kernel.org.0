Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614971F6386
	for <lists+linux-tegra@lfdr.de>; Thu, 11 Jun 2020 10:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgFKI0P (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 11 Jun 2020 04:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbgFKI0P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Jun 2020 04:26:15 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2856EC08C5C1
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2020 01:26:15 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id p5so5166055wrw.9
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2020 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ffl5DffkUJVRpn1KdY9T29WmffxTORturS2cf5oCC9o=;
        b=wa9LpQfJOfJ1BlrDYBAbP3nM7Nz2q/CQsjWbPmh4xKhAi3i+5NVIL9OCqBSX/9p4p+
         HyUnVFQDiZ9fU2EobEZXu5oAZJeetWaDM3n3aBkTudxjpVcCNb+mOLAROkkb/chAWTSJ
         ZvsVJKdmLkjqKYyMNKIXNzbSCY3SeaVSvxlTdHETpFSufhzn8NbM80HRBn+TwXNFsDdl
         FMCqsQyfjWa3RuhVrXfdRwpfldZ+Oz+a1AErW4rDKYhX+DRMN2x3ifFnMoKzI+NkH4LU
         CfITDscNEh8GAHNeb9B1Gh749qoUf4GKhtYdN0S/YbNZ3PCUNbm5kc7Zfpb2XrjXnx47
         ofjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ffl5DffkUJVRpn1KdY9T29WmffxTORturS2cf5oCC9o=;
        b=BpOAY3iNGh0b8nuq7zLbbn9XcuCchAzQYGp8EQGR9GZdlXHTTWDJaudrJDF/WrwqNF
         FMdFaL8UssS1zqSrRFCoKrFk2fjpgffk99hr+SAF/4C9x9zZay2+ivMz4DEDpyipY55/
         MBbc+iOeb3FZenCmIHo9cc5/HMcTU5UyXipohnUrSyhOXQYIzP75xPCqAQIVHo2JfQhq
         DvzINq9nNnfQXEYPRMvXAjaL7QlEXePxnrq0fJJ9XvrYiV3mRZwD5vyflZSD/lq3UL9V
         OMT7txCNG0i/X0Ap496ibVqZIRL8CWbPRWQwPL2HglASKj5xKcusJuSzEes3hO1wj5Uu
         0gKg==
X-Gm-Message-State: AOAM532qjYt/8qj8juoxOCfj0eB0f+uw2qZoH3aDyZCwtobBpYcE2+ms
        fk5hFWqC5XlhyWX4sUkRDgGA/2PX++ONz5bJjLUC0PqR6gY=
X-Google-Smtp-Source: ABdhPJy56NIBFHOxb/szKyuMHMYAq5Nhrhedew2jlPV4ckPWRdRZ9GbO0VG8xsE5J5IFkh8wCUYB3EcMUyUdVZWwVzM=
X-Received: by 2002:a5d:4245:: with SMTP id s5mr8244643wrr.6.1591863592231;
 Thu, 11 Jun 2020 01:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200610113059.2164132-1-thierry.reding@gmail.com> <ca53d82f-1fd0-b2da-cfbf-7183a977e1d1@gmail.com>
In-Reply-To: <ca53d82f-1fd0-b2da-cfbf-7183a977e1d1@gmail.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Thu, 11 Jun 2020 09:17:51 +0100
Message-ID: <CAPj87rMcXQozYX90wGYbv_vNnQ0-fLLnEdH3Lzio+B1L7xZuYg@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Add zpos property for cursor planes
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

On Thu, 11 Jun 2020 at 08:54, Dmitry Osipenko <digetx@gmail.com> wrote:
> 10.06.2020 14:30, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> > As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> > have a zpos property") a warning is emitted if there's a mix of planes
> > with and without a zpos property.
>
> What problem does it solve?

Well, it fixes the WARN_ON, which asserts that either no planes have
the zpos property attached, or all planes have the zpos property
attached. When only _some_ planes have the property, the property is
pretty much useless: zpos exists to guarantee to userspace the
relative ordering between planes, defined by the value of the
property. If not all planes have the property, then userspace cannot
reason about the ordering, since some of the planes have undefined
ordering.

Cheers,
Daniel
